#!/bin/sh -x

# Common Use - A3 size
# -----------------------------
# image size      : 420 x 297 mm (5787 x 4093 px recommended)
# circle size     : 70 mm
# circle count    : 6 (per 420mm)
# repeatable unit : (5787 / 6) x 2 = 1930 px
# -----------------------------

. util.sh

UNITSIZE=1930
IMGH=5787 ; REPTY=4
IMGW=4093 ; REPTX=4

RESFILE=resources/mm48-1_mono_unit.png
PRODUCT=mm48-1_mono_common_a3
prepare_mono
gm convert -density 1200 -resize ${UNITSIZE}x${UNITSIZE} $RESFILE tmp/$PRODUCT-unit.png
gm convert -append `seq 1 $REPTY | awk '{printf "'tmp/$PRODUCT'-unit.png "}'` tmp/$PRODUCT-line.png
gm convert +append `seq 1 $REPTX | awk '{printf "'tmp/$PRODUCT'-line.png "}'` tmp/$PRODUCT-rect.png
gm convert -gravity center -crop ${IMGW}x${IMGH}+0+0 tmp/$PRODUCT-rect.png tmp/$PRODUCT-full.png
pngquant --force --speed 1 --nofs --strip tmp/$PRODUCT-full.png --output images-dist/$PRODUCT.png
chmod 777 images-dist/$PRODUCT.png
rm -f tmp/$PRODUCT-*.png

RESFILE=resources/mm48-1_koto_unit.png
PRODUCT=mm48-1_koto_common_a3
prepare_koto
gm convert -density 1200 -resize ${UNITSIZE}x${UNITSIZE} $RESFILE tmp/$PRODUCT-unit.png
gm convert -append `seq 1 $REPTY | awk '{printf "'tmp/$PRODUCT'-unit.png "}'` tmp/$PRODUCT-line.png
gm convert +append `seq 1 $REPTX | awk '{printf "'tmp/$PRODUCT'-line.png "}'` tmp/$PRODUCT-rect.png
gm convert -gravity center -crop ${IMGW}x${IMGH}+0+0 tmp/$PRODUCT-rect.png tmp/$PRODUCT-full.png
pngquant --force --speed 1 --nofs --strip tmp/$PRODUCT-full.png --output images-dist/$PRODUCT.png
chmod 777 images-dist/$PRODUCT.png
rm -f tmp/$PRODUCT-*.png
