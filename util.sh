#!/bin/sh

function prepare_mono() {
	RESBASE=mm48-1_mono_unit
	TMPSIZE=$((15000+15))
	RESSIZE=6000
	[ ! -f "resources/$RESBASE.svg" ] && unzip resources/$RESBASE.zip -d resources/
	[ ! -f "resources/$RESBASE.png" ] && {
		rsvg-convert --format=png --width=${TMPSIZE} --height=${TMPSIZE} --output=tmp/$RESBASE-1.png resources/$RESBASE.svg
		gm convert -gravity center -crop ${RESSIZE}x${RESSIZE}+0+0! tmp/$RESBASE-1.png tmp/$RESBASE-2.png
		pngquant --force --speed 1 --nofs --strip tmp/$RESBASE-2.png --output resources/$RESBASE.png
		rm -f tmp/$RESBASE-*.png
	}
}

function prepare_koto() {
	RESBASE=mm48-1_koto_unit
	TMPSIZE=$((12500+15))
	MIDSIZE=5000
	CUTSIZE=7071  # $MIDSIZE / sqrt(2)
	RESSIZE=6000
	RESSCRX=$(( $RESSIZE / 4 ))
	RESSCRY=$(( $RESSIZE / 4 ))
	
	[ ! -f "resources/$RESBASE.svg" ] && unzip resources/$RESBASE.zip -d resources/
	[ ! -f "resources/$RESBASE.png" ] && {
		rsvg-convert --format=png --width=${TMPSIZE} --height=${TMPSIZE} --output=tmp/$RESBASE-1.png resources/$RESBASE.svg
		gm convert -gravity center -crop ${MIDSIZE}x${MIDSIZE}+0+0! tmp/$RESBASE-1.png tmp/$RESBASE-2.png
		gm convert -append `seq 1 2 | awk '{printf "'tmp/$RESBASE'-2.png "}'` tmp/$RESBASE-3.png
		gm convert +append `seq 1 2 | awk '{printf "'tmp/$RESBASE'-3.png "}'` tmp/$RESBASE-4.png
		gm convert +rotate 45 -gravity center -crop ${CUTSIZE}x${CUTSIZE}+0+0! tmp/$RESBASE-4.png tmp/$RESBASE-5.png
		gm convert -resize ${RESSIZE}x${RESSIZE} -roll -${RESSCRX}-${RESSCRY} tmp/$RESBASE-5.png tmp/$RESBASE-6.png
		pngquant --force --speed 1 --nofs --strip tmp/$RESBASE-6.png --output resources/$RESBASE.png
		rm -f tmp/$RESBASE-*.png
	}
}
