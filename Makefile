-include .env
export

CC:=gcc
CFLAGS:=-Wall -Werror -std=gnu99 -Ofast

all: default
default: nvelox

$(NVELOX): CFLAGS+=Ilibs/
NVELOX:=~/.local/lib/libnvelox.so

NVELOX_DIR:=$${HOME}/.local/lib
NVELOX_INCLUDE_DIR:=$${HOME}/.local/include
NVELOX_BUILD_DIR:=build

NVELOX_SOURCES:=$(shell find libs/nvelox -type f -name '*.c')
NVELOX_OBJECTS:=$(patsubst %.c,build/%.o, $(NVELOX_SOURCES))
NVELOX_HEADERS:=$(shell find libs/nvelox -type f -name '*.h')

$(NVELOX_BUILD_DIR)/%.o: %.c $(NVELOX_HEADERS)
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

$(NVELOX): $(NVELOX_OBJECTS)
	@mkdir -p $(NVELOX_DIR)
	@mkdir -p $(NVELOX_INCLUDE_DIR)
	cp -r libs/nvelox/include/nvelox $(NVELOX_INCLUDE_DIR)
	$(CC) -shared -fPIC -o $@ $(NVELOX_OBJECTS)



clean:
	rm $(NVELOX)
	rm -rf $(NVELOX_INCLUDE_DIR)/nvelox

nvelox: $(NVELOX)

luaconfig: $(LUACONFIG)

NVIM_PATH?=nvim

test: $(LUACONFIG)
	@LUA_CPATH="$(ROOT_DIR)/lua/?/init.so;$(ROOT_DIR)/lua/?.so" LUA_PATH="./lua/?.lua;$(ROOT_DIR)/examples/?/init.lua;$(ROOT_DIR)/examples/nvlx/?.lua;;" $(NVIM_PATH) -u init.lua

debug: $(LUACONFIG)
	@LUA_CPATH="$(ROOT_DIR)/lua/?/init.so;$(ROOT_DIR)/lua/?.so" LUA_PATH="./lua/?.lua;$(ROOT_DIR)/examples/?/init.lua;$(ROOT_DIR)/examples/nvlx/?.lua;;" $(NVIM_PATH) -u init.lua --headless +q
