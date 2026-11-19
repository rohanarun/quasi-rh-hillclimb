"""Reprice one fixed contact candidate with smaller allowed witness losses.
No count, status, guard, enclosure, finite return operation or parameter bound
is weakened. The full primitive arithmetic is the received Local088 program.
"""
import argparse
import hashlib
import json
import sys
from pathlib import Path

def digest(b):
    return hashlib.sha256(b).hexdigest()

def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--source',type=Path,default=Path(__file__).resolve().parents[2]/'cycle088/near_record/CHECK_FULL.py')
    parser.add_argument('--output',type=Path,required=True)
    opts=parser.parse_args()
    src=opts.source.resolve(strict=True)
    b=src.read_bytes()
    assert digest(b)=='f7bf71ba5fab7d2e44a20dab7cf128e19a4842d44edb8ea916be14c85b1076d4'
    raw=b.decode('utf-8').replace('\r\n','\n')
    old="ann=Q('1e-10'); fee=Q('1e-10')"
    new="ann=Q('1e-13'); fee=Q('1e-13')"
    assert raw.count(old)==1
    run=raw.replace(old,new)
    mark="'checker_sha256':sha256(Path(__file__).read_bytes()).hexdigest(),"
    assert run.count(mark)==1
    run=run.replace(mark, "'checker_sha256':wrapper_sha,'upstream_checker_sha256':sha256(Path(__file__).read_bytes()).hexdigest(),'effective_program_sha256':effective_sha,")
    ident=digest(run.encode()); w=digest(Path(__file__).read_bytes())
    # __file__ continues to resolve the actual inherited mathematical sources;
    # the receipt separately identifies the upstream, wrapper and expanded code.
    dest=opts.output.resolve()
    assert not dest.exists()
    args=[str(src),'--target','.126667206','--h-add','.0022595743','--steps','65536','--depth','13','--output',str(dest)]
    print(json.dumps({'target':args[2],'upstream':str(src),'expanded_sha256':ident,'wrapper_sha256':w,'witness_slack':'1e-13','fee':'1e-13','cutoff_subintervals':65536,'depth':13}),flush=True)
    sys.path.insert(0,str(src.parent));sys.argv=args
    exec(compile(run,str(src),'exec'),{'__name__':'__main__','__file__':str(src),'wrapper_sha':w,'effective_sha':ident})
if __name__=='__main__':
    main()

