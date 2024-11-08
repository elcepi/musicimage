#! /bin/sh

# sudo smartctl -l selftest /dev/sdb1

# IFS=$'\n'
# find ~/Music -regextype posix-extended -iregex '.*\.(flac|mp3|ogg)$' -exec addImage.sh {} \;

# IFS=$'\n'
# for i in `find ~/Music -regextype posix-extended -iregex '.*\.(flac|mp3|ogg)$'`
# do
#    z=`dirname "${i}"`
#    fn=`basename "${i}"`
#    cd "${z}"m
#    mv -f _"${fn}" "${fn}"
# done

z=`dirname "${1}"`
fn=`basename "${1}"`
n=cover.jpg
#a="${z}"/"${n}"

cd "${z}"

#echo "${1}"
# kid3-cli -c "set MUSICBRAINZ_ALBUMARTISTID ''" "${1}"
# kid3-cli -c "set MUSICBRAINZ_ALBUMID ''" "${1}"
# kid3-cli -c "set MUSICBRAINZ_ARTISTID ''" "${1}"
# kid3-cli -c "set MUSICBRAINZ_DISCID ''" "${1}"
# kid3-cli -c "set MUSICBRAINZ_TRACKID ''" "${1}"

if [ -s "${fn}" -a -s "${n}" ]
then
    b=`exiftool -b -picture "${fn}" | head | wc -l` 2>/dev/null
    if [ "${b}" -eq 0 ]
#    if kid3-cli -c 'get' "${fn}" | grep -q Picture
    then
        :
        #echo "${1} *"
        echo "${1}"
        #echo 1
        kid3-cli -c "set Picture '${n}' ''" "${fn}"
        #lame --ti "${n}" "${fn}"
        #mid3v2 --picture "${n}" "${fn}"
        #id3v2 --APIC "${n}" "${fn}"
        ##metaflac --import-picture-from="${n}" "${fn}"
        #eyeD3 --add-image "${n}":FRONT_COVER "${fn}"
        #addImage.py "${fn}" "${n}"#
        #ffmpeg -i "${fn}" -i "${n}" -map_metadata 0 -map 0 -map 1 "_${fn}" && mv -f "_${fn}" "${fn}"
    else
        :
        #echo 0
    fi
else
    :
    #echo 0
fi
