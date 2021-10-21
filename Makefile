-include .env
export

CC=gcc
CFLAGS=-Wall -Werror -fpic -std=gnu99 -Ofast -Isrc/include
CFILES=$(shell find src/ -name '*.c' -o -name '*.h')
TARGET=lua/nvelox/init.so
NVIM_PATH?=nvim
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

all: build

build: $(CFILES)
	mkdir -p lua/nvelox
	$(CC) $(CFLAGS) -shared $(CFILES) -o $(TARGET)

test: build
	LUA_CPATH="$(ROOT_DIR)/lua/?/init.so;$(ROOT_DIR)/lua/?.so" LUA_PATH="./lua/?.lua;$(ROOT_DIR)/examples/?/init.lua;$(ROOT_DIR)/examples/nvlx/?.lua;;" $(NVIM_PATH) -u init.lua

debug:
	LUA_CPATH="$(ROOT_DIR)/lua/?/init.so;$(ROOT_DIR)/lua/?.so" LUA_PATH="./lua/?.lua;$(ROOT_DIR)/examples/?/init.lua;$(ROOT_DIR)/examples/nvlx/?.lua;;" $(NVIM_PATH) -u init.lua --headless +q

clean:
	rm -rf lua/nvelox
