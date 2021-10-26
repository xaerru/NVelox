-include .env
export

CC=gcc
CFLAGS=-Wall -Werror -fpic -std=gnu99 -Ofast -Isrc/include
TARGET=lua/nvelox/init.so
NVIM_PATH?=nvim
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

.PHONY: default all clean

default: $(TARGET)
all: default

SOURCES=$(shell find src/ -name '*.c')
OBJECTS = $(patsubst %.c, %.o, $(SOURCES))
HEADERS = $(wildcard *.h)

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

.PRECIOUS: $(TARGET) $(OBJECTS)

$(TARGET): $(OBJECTS)
	mkdir -p lua/nvelox
	$(CC) $(OBJECTS) -shared -o $@

remake: clean all

clean:
	rm -rf lua/nvelox
	find . -type f -name '*.o' -delete

test: $(TARGET)
	LUA_CPATH="$(ROOT_DIR)/lua/?/init.so;$(ROOT_DIR)/lua/?.so" LUA_PATH="./lua/?.lua;$(ROOT_DIR)/examples/?/init.lua;$(ROOT_DIR)/examples/nvlx/?.lua;;" $(NVIM_PATH) -u init.lua

debug:
	LUA_CPATH="$(ROOT_DIR)/lua/?/init.so;$(ROOT_DIR)/lua/?.so" LUA_PATH="./lua/?.lua;$(ROOT_DIR)/examples/?/init.lua;$(ROOT_DIR)/examples/nvlx/?.lua;;" $(NVIM_PATH) -u init.lua --headless +q
