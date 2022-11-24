#!/usr/bin/env bash


generate_from_md() {
    for file in *.md; do
        [ -f "${file}" ] || break
        pandoc -V papersize:a4 --highlight-style breezeDark --pdf-engine xelatex -o "${file%.*}.pdf" ${file}
    done
}

generate_from_qmd() {
    for file in *.qmd;  do
        [ -f "${file}" ] || break
        quarto render ${file} --to pdf
    done
}


generate_from_md
generate_from_qmd
