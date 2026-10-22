// Independent exact replay: node auto-research/verify_track_a.mjs
// Uses only Node built-ins. Known points are credited in track-a-independent-replay.md.
import assert from 'node:assert/strict';

function gcd(a, b) {
  a = a < 0n ? -a : a;
  b = b < 0n ? -b : b;
  while (b !== 0n) [a, b] = [b, a % b];
  return a;
}

class Rational {
  constructor(n, d = 1n) {
    assert(typeof n !== 'number' || Number.isSafeInteger(n), 'Use a BigInt for large integers');
    assert(typeof d !== 'number' || Number.isSafeInteger(d), 'Use a BigInt for large integers');
    n = BigInt(n); d = BigInt(d);
    assert.notEqual(d, 0n, 'Zero denominator');
    if (d < 0n) { n = -n; d = -d; }
    const g = gcd(n, d);
    this.n = n / g; this.d = d / g;
  }
  add(other) { const b = q(other); return q(this.n * b.d + b.n * this.d, this.d * b.d); }
  sub(other) { return this.add(q(other).neg()); }
  mul(other) { const b = q(other); return q(this.n * b.n, this.d * b.d); }
  div(other) { const b = q(other); return q(this.n * b.d, this.d * b.n); }
  neg() { return q(-this.n, this.d); }
  cmp(other) {
    const b = q(other), difference = this.n * b.d - b.n * this.d;
    return difference < 0n ? -1 : difference > 0n ? 1 : 0;
  }
  eq(other) { return this.cmp(other) === 0; }
  toString() { return this.d === 1n ? `${this.n}` : `${this.n}/${this.d}`; }
}

function q(n, d = 1n) { return n instanceof Rational ? n : new Rational(n, d); }
const HALF = q(1, 2), ALPHA = q(5, 6), Z0 = q(17, 50);
const BOX = [[q(0), ALPHA], [q(0), HALF]];
const U = [q(0), HALF, q(1)], V = [q(0), q(1, 3), q(2, 3), q(1)];

function denominator(delta, y) {
  return q(185).add(y.mul(170))
    .add(delta.mul(q(-138).add(y.mul(12)).add(y.mul(y).mul(96))));
}

function adaptive(ell, h, delta, y) {
  const p = q(7).add(y.mul(18)).add(y.mul(y).mul(8));
  const rest = q(5, 12).sub(delta.div(2))
    .sub(ell.mul(q(3, 4).add(delta.mul(q(3, 2).sub(y)))))
    .add(h.mul(delta.sub(q(1, 3))));
  return rest.mul(denominator(delta, y))
    .sub(h.mul(6).mul(ALPHA.sub(delta)).mul(delta).mul(p));
}

function highExponent(ell, h, delta, amplitude, count, scale) {
  return q(-5, 12).add(delta.div(2))
    .add(ell.mul(q(3, 4).add(delta).add(amplitude)))
    .add(h.mul(Z0.sub(q(2, 3)).sub(delta.div(2))))
    .add(scale.mul(count.add(delta.div(2)).sub(Z0)));
}

function sides(ell, h) {
  const b = h.mul(2).sub(1).sub(ell.mul(3)), ly = h.sub(ell.mul(2));
  const endpoint = (delta, count, scale) =>
    highExponent(ell, h, delta, delta.div(2), count, scale).neg();
  return [
    ['floor', endpoint(q(1, 50), q(1), h)],
    ['large delta', endpoint(ALPHA, q(1).sub(ALPHA), h)],
    ['intermediate low', endpoint(q(1, 50), q(1), HALF)],
    ['intermediate high', endpoint(ALPHA, q(103, 225), HALF)],
    ['small rows', h.mul(Z0.sub(q(1, 6))).sub(ly.div(2)).add(q(1, 50)).neg()],
    ['prime supply', ell.div(h).sub(q(7, 37))],
    ['extension', ell.mul(5).sub(h)],
    ['b', b],
    ['low l_x', q(1).sub(h)],
    ['low l_y', ly.sub(ell).sub(b.mul(q(11, 6)))],
    ['low M', q(1).sub(ell.mul(3))],
    ['high coefficient', q(1).sub(h.div(4))],
  ];
}

// Invert Bernstein evaluation at 0,1/2,1 and at 0,1/3,2/3,1.
function quadratic([a, b, c]) { return [a, b.mul(2).sub(a.add(c).div(2)), c]; }
function cubic([a, b, c, d]) {
  return [a,
    a.mul(q(-5, 6)).add(b.mul(3)).sub(c.mul(q(3, 2))).add(d.div(3)),
    a.div(3).sub(b.mul(q(3, 2))).add(c.mul(3)).sub(d.mul(q(5, 6))), d];
}

function bernstein(poly, box) {
  // Every polynomial used here has degree at most two in delta and three in y.
  const [[d0, d1], [y0, y1]] = box;
  const samples = U.map(u => V.map(v =>
    poly(d0.add(d1.sub(d0).mul(u)), y0.add(y1.sub(y0).mul(v)))));
  const columns = V.map((_, j) => quadratic(samples.map(row => row[j])));
  return U.map((_, i) => cubic(columns.map(column => column[i])));
}

function minimum(values) { return values.reduce((a, b) => a.cmp(b) < 0 ? a : b); }

function provePositive(poly, box, maxDepth, depth = 0) {
  const lower = minimum(bernstein(poly, box).flat());
  if (lower.cmp(0) > 0) return [{ box, lower, depth }];
  if (depth >= maxDepth) {
    throw new Error(`No positivity certificate by depth ${maxDepth}; this is not a disproof`);
  }
  const width = box.map(([lo, hi]) => hi.sub(lo));
  const axis = width[0].cmp(width[1]) >= 0 ? 0 : 1;
  const mid = box[axis][0].add(box[axis][1]).div(2);
  const left = box.map(interval => [...interval]), right = box.map(interval => [...interval]);
  left[axis][1] = mid; right[axis][0] = mid;
  return [...provePositive(poly, left, maxDepth, depth + 1),
    ...provePositive(poly, right, maxDepth, depth + 1)];
}

function area(box) { return box[0][1].sub(box[0][0]).mul(box[1][1].sub(box[1][0])); }
function sum(values) { return values.reduce((a, b) => a.add(b), q(0)); }
function power(x, n) { let r = q(1); for (let k = 0; k < n; k++) r = r.mul(x); return r; }

function selfCheck() {
  assert(q(2, -4).eq(q(-1, 2)));
  assert(q(9007199254740993n).add(1).eq(q(9007199254740994n)));
  assert(q(7, 9).mul(q(27, 14)).eq(q(3, 2)));
  assert(q(0, -7).eq(0));
  assert.throws(() => q(1, 0), /Zero denominator/);
  assert.throws(() => q(1).div(0), /Zero denominator/);
  assert.throws(() => q(Number.MAX_SAFE_INTEGER + 1), /Use a BigInt/);
  assert.throws(() => q(1, Number.MAX_SAFE_INTEGER + 1), /Use a BigInt/);

  const unit = [[q(0), q(1)], [q(0), q(1)]];
  // Every tensor basis function must reconstruct its own unit coefficient vector.
  for (const box of [unit, [[q(1, 7), q(4, 7)], [q(2, 9), q(5, 9)]]]) {
    for (let i = 0; i < 3; i++) for (let j = 0; j < 4; j++) {
      const poly = (delta, y) => {
        const u = delta.sub(box[0][0]).div(box[0][1].sub(box[0][0]));
        const v = y.sub(box[1][0]).div(box[1][1].sub(box[1][0]));
        return power(u, i).mul(power(q(1).sub(u), 2 - i)).mul([1, 2, 1][i])
          .mul(power(v, j)).mul(power(q(1).sub(v), 3 - j)).mul([1, 3, 3, 1][j]);
      };
      const coefficients = bernstein(poly, box);
      coefficients.forEach((row, k) => row.forEach((value, l) =>
        assert(value.eq(k === i && l === j ? 1 : 0), 'Bernstein basis reconstruction')));
    }
  }
  const positive = delta => delta.sub(HALF).mul(delta.sub(HALF)).add(q(1, 100));
  assert.throws(() => provePositive(positive, unit, 0), /not a disproof/);
  const leaves = provePositive(positive, unit, 2);
  assert.equal(leaves.length, 2);
  assert(sum(leaves.map(leaf => area(leaf.box))).eq(1));
  assert.throws(() => provePositive(() => q(0), unit, 0), /not a disproof/);
  assert.throws(() => provePositive(() => q(-1), unit, 0), /not a disproof/);
}

selfCheck();
assert(minimum(bernstein(denominator, BOX).flat()).eq(70));
console.log('Self-checks passed; 108J >= 70 on the full rectangle.');

const points = [
  ['paper', q(1, 6), q(13, 16), q(7, 8)],
  ['audited N=5900', q(1, 6).add(q(1, 5900)), q(405989, 500000), q(20649, 23600)],
  ['PR #12 N=5824', q(1, 6).add(q(1, 5824)), q(405967, 500000), q(20383, 23296)],
  ['PR #12 near edge', q(625643953, 3750000000), q(8119602997, 10000000000),
    q(4374785349, 5000000000)],
];

for (const [name, ell, h, sigma] of points) {
  assert(q(11, 12).sub(ell.div(4)).eq(sigma), `${name}: boundary`);
  const margins = sides(ell, h);
  assert.equal(margins.length, 12);
  for (const [label, value] of margins) assert(value.cmp(0) > 0, `${name}: ${label}=${value}`);
  const leaves = provePositive((delta, y) => adaptive(ell, h, delta, y), BOX, 34);
  assert(sum(leaves.map(leaf => area(leaf.box))).eq(q(5, 12)), `${name}: covering area`);
  const lower = minimum(leaves.map(leaf => leaf.lower));
  const depth = Math.max(...leaves.map(leaf => leaf.depth));
  console.log(`CERTIFIED ${name}: sigma0=${sigma}; ${leaves.length} boxes; depth=${depth}; `
    + `minimum Bernstein coefficient=${lower}; 12/12 sides positive.`);
}

const badEll = q(1, 6).add(q(1, 5823)), badH = q(8119602997, 10000000000);
const witness = adaptive(badEll, badH, q(48573, 125000), q(0));
assert(witness.cmp(0) < 0, 'N=5823 negative control');
console.log(`Negative control N=5823: F(48573/125000,0)=${witness} < 0.`);
console.log('Reproduces final-section arithmetic only; no new endpoint or Lean theorem.');
