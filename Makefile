COMPILER = gcc
ARCHIVER = ar
COMPILE_FLAGS = -Wall -I include -O2
LINK_FLAGS = rcs
RM = rm

all: bin/libminiaudio32.a bin/libminiaudio64.a

bin/libminiaudio64.a: build/miniaudio64.o build/stb_vorbis64.o
	$(ARCHIVER) $(LINK_FLAGS) bin/libminiaudio64.a build/miniaudio64.o build/stb_vorbis64.o

build/miniaudio64.o: source/miniaudio.c
	$(COMPILER) $(COMPILE_FLAGS) -D STB_VORBIS_HEADER_ONLY -include source/stb_vorbis.c -c source/miniaudio.c -o build/miniaudio64.o

build/stb_vorbis64.o: source/stb_vorbis.c
	$(COMPILER) $(COMPILE_FLAGS) -c source/stb_vorbis.c -o build/stb_vorbis64.o

bin/libminiaudio32.a: build/miniaudio32.o build/stb_vorbis32.o
	$(ARCHIVER) $(LINK_FLAGS) bin/libminiaudio32.a build/miniaudio32.o build/stb_vorbis32.o

build/miniaudio32.o: source/miniaudio.c
	$(COMPILER) $(COMPILE_FLAGS) -D STB_VORBIS_HEADER_ONLY -include source/stb_vorbis.c -c source/miniaudio.c -o build/miniaudio32.o

build/stb_vorbis32.o: source/stb_vorbis.c
	$(COMPILER) $(COMPILE_FLAGS) -c source/stb_vorbis.c -o build/stb_vorbis32.o

clean:
	$(RM) build/miniaudio32.o build/stb_vorbis32.o bin/libminiaudio32.a
	$(RM) build/miniaudio64.o build/stb_vorbis64.o bin/libminiaudio64.a

.PHONY: clean