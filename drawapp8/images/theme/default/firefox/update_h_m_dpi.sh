#!/bin/bash

function resizeOne() 
{
	FROM=$1/$3;
	TO=$2/$3;
	SCALE=$4;

	echo convert $FROM -resize $SCALE% $TO
	convert $FROM -resize $SCALE% $TO
}

rm -frv hdpi/*.png
rm -frv mdpi/*.png

for f in xhdpi/*.png;
do
	FN=${f/xhdpi\//}
	resizeOne xhdpi hdpi $FN 75;
	resizeOne xhdpi mdpi $FN 50;
done

rm -rf ../firefox/*dpi

cp -rf xhdpi ../firefox
cp -rf hdpi ../firefox
cp -rf mdpi ../firefox
cp -fv hdpi/back_button_* mdpi/

rm -rf ../firefox/xhdpi/.svn
rm -rf ../firefox/hdpi/.svn
rm -rf ../firefox/mdpi/.svn

