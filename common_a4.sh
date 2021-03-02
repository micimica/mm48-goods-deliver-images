#!/bin/sh -x

# Common Use - A4 size
# -----------------------------
# image size      : 297 x 210 mm (4093 x 2894 px recommended)
# circle size     : 70 mm
# circle count    : 3 (per 210mm)
# repeatable unit : (2894 / 3) x 2 = 1930 px
# -----------------------------

. util.sh

UNITSIZE=1930
IMGH=4093 ; REPTY=4
IMGW=2894 ; REPTX=4

RESFILE=resources/mm48-1_mono_unit.png
PRODUCT=mm48-1_mono_common_a4
prepare_mono
gm convert -density 1200 -resize ${UNITSIZE}x${UNITSIZE} $RESFILE tmp/$PRODUCT-unit.png
gm convert -append `seq 1 $REPTY | awk '{printf "'tmp/$PRODUCT'-unit.png "}'` tmp/$PRODUCT-line.png
gm convert +append `seq 1 $REPTX | awk '{printf "'tmp/$PRODUCT'-line.png "}'` tmp/$PRODUCT-rect.png
gm convert -gravity center -crop ${IMGW}x${IMGH}+0+0 tmp/$PRODUCT-rect.png tmp/$PRODUCT-full.png
pngquant --force --speed 1 --nofs --strip tmp/$PRODUCT-full.png --output images-dist/$PRODUCT.png
chmod 777 images-dist/$PRODUCT.png
rm -f tmp/$PRODUCT-*.png

RESFILE=resources/mm48-1_koto_unit.png
PRODUCT=mm48-1_koto_common_a4
prepare_koto
gm convert -density 1200 -resize ${UNITSIZE}x${UNITSIZE} $RESFILE tmp/$PRODUCT-unit.png
gm convert -append `seq 1 $REPTY | awk '{printf "'tmp/$PRODUCT'-unit.png "}'` tmp/$PRODUCT-line.png
gm convert +append `seq 1 $REPTX | awk '{printf "'tmp/$PRODUCT'-line.png "}'` tmp/$PRODUCT-rect.png
gm convert -gravity center -crop ${IMGW}x${IMGH}+0+0 tmp/$PRODUCT-rect.png tmp/$PRODUCT-full.png
pngquant --force --speed 1 --nofs --strip tmp/$PRODUCT-full.png --output images-dist/$PRODUCT.png
chmod 777 images-dist/$PRODUCT.png
rm -f tmp/$PRODUCT-*.png
