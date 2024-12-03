#!/bin/bash
cat input.txt \
| grep -Eo "(mul\(\d+,\d+\)|do(n't)?\(\))" \
| sed -E 's/[mul\(\)]//g' \
| awk -F "," -f solution.awk
