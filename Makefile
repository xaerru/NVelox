-include .env
export

CC:=gcc
CFLAGS:=-Wall -Werror -fpic -std=gnu99 -Ofast -Isrc/include

TARGET:=lua/nvelox/init.so
NVIM_PATH?=nvim

TARGET_DIR:=lua/nvelox
BUILD_DIR:=build
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

SOURCES:=$(shell find src/ -type f -name '*.c')
OBJECTS:= $(patsubst %.c,build/%.o, $(SOURCES))
HEADERS:= $(shell find src/ -type f -name '*.h')

.PHONY: default all clean remake clean test debug
.PRECIOUS: $(TARGET) $(OBJECTS)

default: $(TARGET)
all: default

$(BUILD_DIR)/%.o: %.c $(HEADERS)
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

$(TARGET): $(OBJECTS)
	@mkdir -p $(TARGET_DIR)
	$(CC) $(OBJECTS) -shared -o $@

remake: clean all

clean:
	rm -rf $(TARGET_DIR)
	rm -rf $(BUILD_DIR)

test: $(TARGET)
	@LUA_CPATH="$(ROOT_DIR)/lua/?/init.so;$(ROOT_DIR)/lua/?.so" LUA_PATH="./lua/?.lua;$(ROOT_DIR)/examples/?/init.lua;$(ROOT_DIR)/examples/nvlx/?.lua;;" $(NVIM_PATH) -u init.lua

debug: $(TARGET)
	@LUA_CPATH="$(ROOT_DIR)/lua/?/init.so;$(ROOT_DIR)/lua/?.so" LUA_PATH="./lua/?.lua;$(ROOT_DIR)/examples/?/init.lua;$(ROOT_DIR)/examples/nvlx/?.lua;;" $(NVIM_PATH) -u init.lua --headless +q
