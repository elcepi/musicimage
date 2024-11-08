#!/bin/sh

# IFS=$'\n'
# for i in `find ~/Music -mindepth 2 -type d`
# do
#     cd "${i}"
#     # echo "${i} **** "`pwd`
#     fetchCovers.sh `ls | head -1`
# done

# IFS=$'\n'
# for i in `find ~/Music -iname "*.png" -not -name cover.png -type f`
# do
#     cd `dirname "${i}"`
#     mv -i `basename "${i}"` cover.png
# done
# for i in `find ~/Music -iname "*.jpg" -not -name cover.jpg -type f`
# do
#     cd `dirname "${i}"`
#     mv -i `basename "${i}"` cover.jpg
# done

z=`dirname "${1}"`
fn=`basename "${1}"`
n1=cover.png
n2=cover.jpg

cd "`dirname "${1}"`"

#echo "***** ${1}"
echo "***** "`pwd`

if [ -s "${fn}" ]
then
    if [ ! -s "${n1}" -a ! -s ${n2} ]
    then
        b=`exiftool -b -picture "${fn}" | wc -l`
        if [ "${b}" -eq 0 ]
        then
            glyrc cover --parallel 30 --from "all;-jamendo" --artist "`mediainfo --Inform="General;%Performer%" "${fn}"`" --album "`mediainfo --Inform="General;%Album%" "${fn}"`"
        fi
    fi
fi
