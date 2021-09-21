CC=gcc
CFLAGS=-Wall -Werror -fpic -std=gnu99 -Ofast -Isrc/include
CFILES=$(shell find src/ -type f -name '*.c')
HFILES=$(shell find src/ -type f -name '*.h')
TARGET=lua/_nvlx/build/init.so

all: build

build: $(CFILES) $(HFILES)
	mkdir -p lua/_nvlx/build
	$(CC) $(CFLAGS) -shared $(CFILES) -o $(TARGET)

test: build
	nvim -u init.lua

clean:
	rm -rf lua/_nvlx/build
