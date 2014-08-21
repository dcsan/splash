#!/usr/bin/env sh

# FILES=scenes/**/**/*.png
FILES=covers/*/*.png
echo "processing"

for f in $FILES;
do
  # echo "${f}"
  # convert -quality 1 $f $f.q1.jpg
  # convert -quality 20 $f $f.q2.jpg
  fout="${f/.png/-350.jpg}"
  echo $fout
  convert -resize 350x -quality 50 $f $fout

  ## smaller png
  fout="${f/.png/-350.png}"
  convert -resize 350x -colors 256 $f $fout

  # convert -quality 75 $f $f.q4.jpg
  # convert -quality 100 $f $f.q5.jpg
  # convert $f $f.bmp
  # potrace -s $f.bmp
  # mv $f.bmp.svg $f.svg

  # break  
done
