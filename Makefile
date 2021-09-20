CC=gcc
CFLAGS=-Wall -Werror -fpic -std=gnu99 -Ofast -Isrc/include
CFILES=$(shell find src/ -type f -name '*.c')
TARGET=build/init.so

all: build

build: $(CFILES)
	mkdir -p build/
	$(CC) $(CFLAGS) -shared $(CFILES) -o $(TARGET)

test: build
	nvim -u init.lua

clean:
	rm -rf build/
