#!/usr/bin/python3

import mutagen.id3
import mutagen
import magic
import sys
import os

musicfile=sys.argv[1]
picfile=sys.argv[2]
audio = mutagen.File(musicfile)
mime = magic.Magic(mime=True)

try:
   if hasattr(audio, "add_tags"):
      audio.add_tags()
except Exception as e:
    print("aaaa", e)
    print(e)

if hasattr(audio.tags, "add_tags"):
    try:
        audio.tags.add(
            APIC(
            encoding=1,
            mime=mime.from_file(musicfile),
            type=3,
            desc=u'Cover',
            data=open(picfile).read()
            )
        )
    except Exception as e:
        print("bbbb", e)
        print(e)

audio.save()
