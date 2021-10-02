CC=gcc
CFLAGS=-Wall -Werror -fpic -std=gnu99 -Ofast -Isrc/include
CFILES=$(shell find src/ -name '*.c' -o -name '*.h')
TARGET=lua/_nvlx/build/init.so

ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

all: build

build: $(CFILES)
	mkdir -p lua/_nvlx/build
	$(CC) $(CFLAGS) -shared $(CFILES) -o $(TARGET)

test: build
	LUA_PATH="$(ROOT_DIR)/examples/?/init.lua;$(ROOT_DIR)/examples/nvlx/?.lua;;" nvim -u init.lua

debug: 
	nvim -u init.lua --headless +q

clean:
	rm -rf lua/_nvlx/build
