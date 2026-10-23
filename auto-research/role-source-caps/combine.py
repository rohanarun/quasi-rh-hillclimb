"""Rename and concatenate the two finite numerical source graphs."""

import argparse
import json
from pathlib import Path


def combine(count, physical):
    result = []
    for nodes, prefix in [(count, "count"), (physical, "physical")]:
        for raw in nodes:
            node = dict(raw)
            for key in ["id", "low", "high"]:
                if node[key] != "natural":
                    assert node[key].startswith("vector_")
                    node[key] = prefix + "_" + node[key].removeprefix("vector_")
            result.append(node)
    return result


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("count")
    parser.add_argument("physical")
    parser.add_argument("--output", required=True)
    args = parser.parse_args()
    graph = combine(
        json.loads(Path(args.count).read_text()),
        json.loads(Path(args.physical).read_text()),
    )
    Path(args.output).write_text(json.dumps(graph, indent=2) + "\n")
