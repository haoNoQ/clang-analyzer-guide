#!/bin/sh
rm -rf *.blg *.bib *.aux *.bcf *.idx *.ind *.bbl *.dvi *.out *.svg *.pdf
for dia in *.dia; do
  svg="$(basename $dia .dia).svg"
  pdf="$(basename $dia .dia).pdf"
  dia -t svg -e "$svg" "$dia"
  rsvg-convert -f pdf -o "$pdf" "$svg"
done

guide="clang-analyzer-guide"
pdflatex ${guide}.tex < /dev/null > /dev/null 2>&1
makeindex -p 1 ${guide}.idx
makeindex -p 1 notion.idx
pdflatex ${guide}.tex < /dev/null > /dev/null 2>&1
pdflatex ${guide}.tex
