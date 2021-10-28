-include .env
export

CC:=gcc
CFLAGS:=-Wall -Werror -fpic -std=gnu99 -Ofast -Isrc -Isrc/luaconfig/luajit -Isrc/include

LUACONFIG:=lua/nvelox/init.so
NVIM_PATH?=nvim

LUACONFIG_DIR:=lua/nvelox
BUILD_DIR:=build
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

.PHONY: default all clean remake clean test debug
.PRECIOUS: $(LUACONFIG) $(OBJECTS)

default: luaconfig
all: default

SOURCES:=$(shell find src/luaconfig -type f -name '*.c')
OBJECTS:= $(patsubst %.c,build/%.o, $(SOURCES))
HEADERS:= $(shell find src/luaconfig -type f -name '*.h')
$(BUILD_DIR)/%.o: %.c $(HEADERS)
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

$(LUACONFIG): $(OBJECTS)
	@mkdir -p $(LUACONFIG_DIR)
	$(CC) $(OBJECTS) -shared -o $@

luaconfig: $(LUACONFIG)

remake: clean all

clean:
	rm -rf $(LUACONFIG_DIR)
	rm -rf $(BUILD_DIR)

test: $(LUACONFIG)
	@LUA_CPATH="$(ROOT_DIR)/lua/?/init.so;$(ROOT_DIR)/lua/?.so" LUA_PATH="./lua/?.lua;$(ROOT_DIR)/examples/?/init.lua;$(ROOT_DIR)/examples/nvlx/?.lua;;" $(NVIM_PATH) -u init.lua

debug: $(LUACONFIG)
	@LUA_CPATH="$(ROOT_DIR)/lua/?/init.so;$(ROOT_DIR)/lua/?.so" LUA_PATH="./lua/?.lua;$(ROOT_DIR)/examples/?/init.lua;$(ROOT_DIR)/examples/nvlx/?.lua;;" $(NVIM_PATH) -u init.lua --headless +q
