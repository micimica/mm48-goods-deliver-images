#!/bin/sh -x

# [pixivFACTORY] Poster - B1 size
# https://factory.pixiv.net/products/fast_poster
# -----------------------------
# image size      : 734 x 1036 mm (10115 x 14276 px recommended)
# circle size     : 81.56 mm
# circle count    : 9 (per 724mm)    *724mm = 734mm - margin(5mm x 2)
# repeatable unit : (10115 * (724/734) / 9) x 2 = 2217 px
# -----------------------------

. util.sh

UNITSIZE=2217
IMGH=14276 ; REPTY=8
IMGW=10115 ; REPTX=6

RESFILE=resources/mm48-1_mono_unit.png
PRODUCT=mm48-1_mono_pixivfactory_poster_b1
prepare_mono
gm convert -density 1200 -resize ${UNITSIZE}x${UNITSIZE} $RESFILE tmp/$PRODUCT-unit.png
gm convert -append `seq 1 $REPTY | awk '{printf "'tmp/$PRODUCT'-unit.png "}'` tmp/$PRODUCT-line.png
gm convert +append `seq 1 $REPTX | awk '{printf "'tmp/$PRODUCT'-line.png "}'` tmp/$PRODUCT-rect.png
gm convert -gravity center -crop ${IMGW}x${IMGH}+0+0 tmp/$PRODUCT-rect.png tmp/$PRODUCT-full.png
pngquant --force --speed 1 --nofs --strip tmp/$PRODUCT-full.png --output images-dist/$PRODUCT.png
chmod 777 images-dist/$PRODUCT.png
rm -f tmp/$PRODUCT-*.png

RESFILE=resources/mm48-1_koto_unit.png
PRODUCT=mm48-1_koto_pixivfactory_poster_b1
prepare_koto
gm convert -density 1200 -resize ${UNITSIZE}x${UNITSIZE} $RESFILE tmp/$PRODUCT-unit.png
gm convert -append `seq 1 $REPTY | awk '{printf "'tmp/$PRODUCT'-unit.png "}'` tmp/$PRODUCT-line.png
gm convert +append `seq 1 $REPTX | awk '{printf "'tmp/$PRODUCT'-line.png "}'` tmp/$PRODUCT-rect.png
gm convert -gravity center -crop ${IMGW}x${IMGH}+0+0 tmp/$PRODUCT-rect.png tmp/$PRODUCT-full.png
pngquant --force --speed 1 --nofs --strip tmp/$PRODUCT-full.png --output images-dist/$PRODUCT.png
chmod 777 images-dist/$PRODUCT.png
rm -f tmp/$PRODUCT-*.png
