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

