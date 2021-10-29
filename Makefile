-include .env
export

CC:=gcc

LUACONFIG:=lua/nvelox/init.so
NVELOX:=lib/libnvelox.a
NVIM_PATH?=nvim

CFLAGS:=-Wall -Werror -std=gnu99 -Ofast
$(LUACONFIG): EXTRA_FLAGS:=-fPIC -Isrc -Isrc/luaconfig/luajit -Isrc/include
$(NVELOX): EXTRA_FLAGS:=-Isrc

LUACONFIG_DIR:=lua/nvelox
NVELOX_DIR:=lib

BUILD_DIR:=build
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

.PHONY: default all clean remake clean test debug
.PRECIOUS: $(LUACONFIG) $(OBJECTS)

default: nvelox luaconfig
all: default

LUACONFIG_SOURCES:=$(shell find src/luaconfig -type f -name '*.c')
LUACONFIG_OBJECTS:= $(patsubst %.c,build/%.o, $(LUACONFIG_SOURCES))
LUACONFIG_HEADERS:= $(shell find src/luaconfig -type f -name '*.h')
$(BUILD_DIR)/%.o: %.c $(LUACONFIG_HEADERS)
	@mkdir -p $(@D)
	$(CC) $(LUACONFIG_CFLAGS) $(EXTRA_FLAGS) -c $< -o $@

$(LUACONFIG): $(LUACONFIG_OBJECTS)
	@mkdir -p $(LUACONFIG_DIR)
	$(CC) $(LUACONFIG_OBJECTS) -L$(ROOT_DIR)/lib/ -lnvelox -shared -o $@

NVELOX_SOURCES:=$(shell find src/nvelox -type f -name '*.c')
NVELOX_OBJECTS:= $(patsubst %.c,build/%.o, $(NVELOX_SOURCES))
NVELOX_HEADERS:= $(shell find src/nvelox -type f -name '*.h')
$(BUILD_DIR)/%.o: %.c $(NVELOX_HEADERS)
	@mkdir -p $(@D)
	$(CC) $(NVELOX_CFLAGS) $(EXTRA_FLAGS) -c $< -o $@

$(NVELOX): $(NVELOX_OBJECTS)
	@mkdir -p $(NVELOX_DIR)
	ar rcs $@ $(NVELOX_OBJECTS)
	#$(CC) $(NVELOX_OBJECTS) -shared -o $@

luaconfig: $(LUACONFIG)

nvelox: $(NVELOX)

remake: clean all

clean:
	rm -rf $(LUACONFIG_DIR)
	rm -rf $(NVELOX_DIR)
	rm -rf $(BUILD_DIR)

test: $(LUACONFIG)
	@LUA_CPATH="$(ROOT_DIR)/lua/?/init.so;$(ROOT_DIR)/lua/?.so" LUA_PATH="./lua/?.lua;$(ROOT_DIR)/examples/?/init.lua;$(ROOT_DIR)/examples/nvlx/?.lua;;" $(NVIM_PATH) -u init.lua

debug: $(LUACONFIG)
	@LUA_CPATH="$(ROOT_DIR)/lua/?/init.so;$(ROOT_DIR)/lua/?.so" LUA_PATH="./lua/?.lua;$(ROOT_DIR)/examples/?/init.lua;$(ROOT_DIR)/examples/nvlx/?.lua;;" $(NVIM_PATH) -u init.lua --headless +q
