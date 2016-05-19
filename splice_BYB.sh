#!/bin/bash

cat  name | while read num myline kind
do   
    if test `echo $myline | wc -c` -eq 7
    then 
        myline="  "$myline
    fi

    convert "mode"$kind".jpg" -font '/usr/share/fonts/truetype/myfonts/STZhongS.ttf'\
        -gravity northwest -fill white -weight bolder -pointsize 100 \
        -draw "text 580,788 '$myline'" dest-c.jpg
    convert -resize '445x625!' $num".jpg" "_"$num".jpg"
    convert -negate "_"$num".jpg" "__"$num".jpg"
    convert dest-c.jpg "__"$num".jpg" -gravity NorthWest \
        -geometry +3128+247 -composite OK.jpg
    if test `echo $num |wc -c` -eq 2
    then
        code="20160"$num
    else
        code="2016"$num
    fi
    convert OK.jpg -font '/usr/share/fonts/truetype/myfonts/HuaWenXiHei.ttf'\
        -gravity northwest -fill white -pointsize 85 \
        -draw "text 2425,629 '$code'" "Num"$num".jpg"
done
rm _* dest* OK*
echo "Finish"
exit 0
