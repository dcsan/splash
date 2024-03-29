#!/bin/bash
# set -x

SOURCE_RES=src
TARGET_RES_LIST=( 256 128 100 64 50 32 )
FILES=$SOURCE_RES/*png

for TARGET_RES in "${TARGET_RES_LIST[@]}"
do
  mkdir -p $TARGET_RES
  for FILE_IN in $FILES
  do
    # echo "Processing ${FILE_IN} file..."

    # base=`basename ${FN} .png`
    FILE_OUT="${FILE_IN/$SOURCE_RES/$TARGET_RES}"

    ## scale on both axes
    # CMD="convert $FILE_IN -resize ${TARGET_RES}x${TARGET_RES} $FILE_OUT"

    # just scale on height
    CMD="convert $FILE_IN -resize x${TARGET_RES} $FILE_OUT"
    echo $CMD
    $CMD
    # break

    # convert -depth 32 $FN ${base}.jpg
    # convert ${base}.jpg ${base}.bmp

    # potrace -s ${base}.bmp

  # mv "$file" "`basename $file .html`.txt"

    # convert $f $f.bmp
    # potrace -s $f.bmp
    # mv $f.bmp.svg $f.svg
  done
done