#!/bin/bash

# simple converter to make svg images
# has to bounce into 24 bit first to remove washed out paletted

set -x
FILES=*.png
for FN in $FILES
do
  echo "Processing ${FN} file..."

  base=`basename ${FN} .png`

  convert -depth 32 $FN ${base}.jpg
  convert ${base}.jpg ${base}.bmp

  potrace -s ${base}.bmp

done
