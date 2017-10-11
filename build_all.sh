#!/bin/bash

graphs=()
graphs+=( "head.dot" "analytical.dot" "experimental.dot" "validations.dot" )
bases=()
for graph in "${graphs[@]}"; do
    base="${graph%.*}"
    bases+=( "$base.pdf" )
    dot -Tpdf $graph -o $base.pdf
done

pdfunite "${bases[@]}" merged.pdf
