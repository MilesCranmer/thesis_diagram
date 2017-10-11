#!/bin/bash

graphs=()
graphs+=( "head.dot" "analytical.dot" "experimental.dot" "validations.dot" )
bases=()
for graph in "${graphs[@]}"; do
    base="${graph%.*}"
    bases+=( "$base.pdf" )
    dot -Gsize="9,15" -Glayout=sfdp -Tpdf $graph -o $base.pdf
done

pdfunite "${bases[@]}" merged.pdf
