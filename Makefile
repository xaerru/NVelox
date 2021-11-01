-include .env
export

CC:=gcc

all: default
default: nvelox luaconfig

ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

NVELOX:=~/.local/lib/libnvelox.so
LUACONFIG:=lua/nvelox.so
NVELOX_BUILD_DIR:=build/libs/nvelox
LUACONFIG_BUILD_DIR:=build/extras/luaconfig

NVELOX_DIR:=$${HOME}/.local/lib
NVELOX_INCLUDE_DIR:=$${HOME}/.local/include

NVELOX_SOURCES:=$(shell find libs/nvelox -type f -name '*.c')
NVELOX_OBJECTS:=$(patsubst %.c,build/libs/nvelox/%.o, $(NVELOX_SOURCES))
NVELOX_HEADERS:=$(shell find libs/nvelox -type f -name '*.h')

$(NVELOX_BUILD_DIR)/%.o: %.c $(NVELOX_HEADERS)
	@mkdir -p $(@D)
	$(CC) -Wall -Werror -std=gnu99 -Ofast -Ilibs/ -c $< -o $@

$(NVELOX): $(NVELOX_OBJECTS)
	@mkdir -p $(NVELOX_DIR)
	@mkdir -p $(NVELOX_INCLUDE_DIR)
	cp -r libs/nvelox/include/nvelox $(NVELOX_INCLUDE_DIR)
	$(CC) -shared -fPIC -o $@ $(NVELOX_OBJECTS)

LUACONFIG_DIR:=lua
LUACONFIG_SOURCES:=$(shell find extras/luaconfig -type f -name '*.c')
LUACONFIG_OBJECTS:= $(patsubst %.c,build/extras/luaconfig/%.o, $(LUACONFIG_SOURCES))
LUACONFIG_HEADERS:= $(shell find extras/luaconfig -type f -name '*.h')
LIB_PATH:=$${HOME}/.local/lib

$(LUACONFIG_BUILD_DIR)/%.o: %.c $(LUACONFIG_HEADERS)
	@mkdir -p $(@D)
	$(CC) -Wall -Werror -std=gnu99 -Ofast -fPIC -Iextras -I$${HOME}/.local/include -Iextras/luaconfig/luajit -c $< -o $@

$(LUACONFIG): $(LUACONFIG_OBJECTS)
	@mkdir -p $(LUACONFIG_DIR)
	$(CC) $(LUACONFIG_OBJECTS) -Wall -Werror -std=gnu99 -Ofast -Wl,-rpath=$(LIB_PATH) -L$(LIB_PATH) -lnvelox -shared -o $@

clean:
	rm $(NVELOX)
	rm -rf $(NVELOX_INCLUDE_DIR)/nvelox
	rm $(LUACONFIG)
	rm -rf build/

nvelox: $(NVELOX)

luaconfig: $(LUACONFIG)

NVIM_PATH?=nvim

test: $(LUACONFIG)
	@LUA_CPATH="$(ROOT_DIR)/lua/?/init.so;$(ROOT_DIR)/lua/?.so" LUA_PATH="./lua/?.lua;$(ROOT_DIR)/examples/?/init.lua;$(ROOT_DIR)/examples/nvlx/?.lua;;" $(NVIM_PATH) -u init.lua

debug: $(LUACONFIG)
	@LUA_CPATH="$(ROOT_DIR)/lua/?/init.so;$(ROOT_DIR)/lua/?.so" LUA_PATH="./lua/?.lua;$(ROOT_DIR)/examples/?/init.lua;$(ROOT_DIR)/examples/nvlx/?.lua;;" $(NVIM_PATH) -u init.lua --headless +q
