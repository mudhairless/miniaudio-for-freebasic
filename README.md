# MINIAUDIO for FreeBASIC

Port of the headers and easy to use from FreeBASIC static libraries built with OGG Vorbis support.

Documentation (C Api): https://miniaud.io/docs/

## Install

### Windows

Copy include/miniaudio.bi to your FreeBASIC inc dir.
Copy bin/libminiaudio*.a to your FreeBASIC lib dir (64 is 64bit and 32 is 32bit if you have both installed)

## Linux and Other Platforms

Build the static library with:

```
    make clean
    make
```

Copy include/miniaudio.bi to your FreeBASIC inc dir.
Copy bin/libminiaudio*.a to your FreeBASIC lib dir (64 is 64bit and 32 is 32bit if you have both installed)
