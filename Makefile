CC=gcc
CFLAGS=-Wall -Werror -fpic -std=gnu99 -Ofast -Isrc/include
CFILES=$(shell find src/ -name '*.c' -o -name '*.h')
TARGET=lua/_nvlx/build/init.so

all: build

build: $(CFILES)
	mkdir -p lua/_nvlx/build
	$(CC) $(CFLAGS) -shared $(CFILES) -o $(TARGET)

test: build
	nvim -u init.lua

debug: 
	nvim -u init.lua --headless +q

clean:
	rm -rf lua/_nvlx/build
