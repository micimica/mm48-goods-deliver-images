#!/usr/bin/env sh

# Common Use - A4 size
# -----------------------------
# image size      : 297 x 210 mm (4093 x 2894 px recommended)
# circle size     : 70 mm
# circle count    : 3 (per 210mm)
# repeatable unit : (2894 / 3) x 2 = 1930 px
# -----------------------------

. common.sh
prepare

RESFILE=mm48-1_unit.svg
PRODUCT=mm48-1_common_a4
UNITSIZE=1930
IMGH=4093 ; REPTY=4
IMGW=2894 ; REPTX=4

convert -density 1200 -resize ${UNITSIZE}x${UNITSIZE} -fuzz 50% -trim tmp/$RESFILE tmp/$PRODUCT-temp.png ; pngquant --force --speed 1 --nofs --strip tmp/$PRODUCT-temp.png --output tmp/$PRODUCT-unit.png
convert -append `seq 1 $REPTY | awk '{printf "'tmp/$PRODUCT'-unit.png "}'` tmp/$PRODUCT-line.png
convert +append `seq 1 $REPTX | awk '{printf "'tmp/$PRODUCT'-line.png "}'` tmp/$PRODUCT-rect.png
convert -gravity center -crop ${IMGW}x${IMGH}+0+0 tmp/$PRODUCT-rect.png tmp/$PRODUCT-full.png ; pngquant --force --speed 1 --nofs --strip tmp/$PRODUCT-full.png --output images-dist/$PRODUCT.png
chmod 777 images-dist/$PRODUCT.png
rm -f tmp/$PRODUCT-*.png
