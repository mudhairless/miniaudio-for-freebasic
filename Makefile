COMPILER = gcc
ARCHIVER = ar
COMPILE_FLAGS = -Wall -I include -O2
LINK_FLAGS = rcs
RM = rm
FBCOMPILER = fbc
FB_COMPILE_FLAGS = -p bin -i include -s console

ifeq '$(findstring ;,$(PATH))' ';'
    detected_OS := Windows
else
    detected_OS := $(shell uname 2>/dev/null || echo Unknown)
    detected_OS := $(patsubst CYGWIN%,Cygwin,$(detected_OS))
    detected_OS := $(patsubst MSYS%,MSYS,$(detected_OS))
    detected_OS := $(patsubst MINGW%,MSYS,$(detected_OS))
endif

ifeq ($(detected_OS),Windows)
    EXE_EXT = .exe
	RM = del
endif

ifeq ($(detected_OS),MSYS)
    EXE_EXT = .exe
endif

ifeq ($(detected_OS),Cygwin)
    EXE_EXT = .exe
endif


all: bin/libminiaudio32.a bin/libminiaudio64.a examples

examples: examples/engine_hello_world$(EXE_EXT)

examples/engine_hello_world$(EXE_EXT): examples/engine_hello_world.bas
	$(FBCOMPILER) $(FB_COMPILE_FLAGS) examples/engine_hello_world.bas -o examples/engine_hello_world$(EXE_EXT)

bin/libminiaudio64.a: build/miniaudio64.o build/stb_vorbis64.o
	$(ARCHIVER) $(LINK_FLAGS) bin/libminiaudio64.a build/miniaudio64.o build/stb_vorbis64.o

build/miniaudio64.o: source/miniaudio.c
	$(COMPILER) $(COMPILE_FLAGS) -m64 -D STB_VORBIS_HEADER_ONLY -include source/stb_vorbis.c -c source/miniaudio.c -o build/miniaudio64.o

build/stb_vorbis64.o: source/stb_vorbis.c
	$(COMPILER) $(COMPILE_FLAGS) -m64 -c source/stb_vorbis.c -o build/stb_vorbis64.o

bin/libminiaudio32.a: build/miniaudio32.o build/stb_vorbis32.o
	$(ARCHIVER) $(LINK_FLAGS) bin/libminiaudio32.a build/miniaudio32.o build/stb_vorbis32.o

build/miniaudio32.o: source/miniaudio.c
	$(COMPILER) $(COMPILE_FLAGS) -m32 -D STB_VORBIS_HEADER_ONLY -include source/stb_vorbis.c -c source/miniaudio.c -o build/miniaudio32.o

build/stb_vorbis32.o: source/stb_vorbis.c
	$(COMPILER) $(COMPILE_FLAGS) -m32 -c source/stb_vorbis.c -o build/stb_vorbis32.o

clean:
	$(RM) build/miniaudio32.o build/stb_vorbis32.o bin/libminiaudio32.a build/miniaudio64.o build/stb_vorbis64.o bin/libminiaudio64.a examples/engine_hello_world$(EXE_EXT)

.PHONY: clean