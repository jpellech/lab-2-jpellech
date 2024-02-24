#! /bin/bash

for c in "-0.4 + 0.6i" "-0.5 + 0.5i" "-0.2 + 0.4i" "-0.5 + 0.3i" "-0.4 + 0.3i"; do
    for s in 200 400 800; do
        cargo run -- --size="$s" --constant="$c" "Julia set $c $s".png
    done
done