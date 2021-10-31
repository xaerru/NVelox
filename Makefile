-include .env
export

CC:=gcc
NVIM_PATH?=nvim
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
MAKE+=--no-print-directory

.PHONY: default all clean remake test debug

default: nvelox luaconfig

all: default

nvelox: 
	@$(MAKE) --directory=src/nvelox 

luaconfig: 
	@$(MAKE) --directory=src/luaconfig

clean:
	rm -rf build/ lib/ lua/

remake: clean nvelox luaconfig

test:
	@LUA_CPATH="$(ROOT_DIR)/lua/?/init.so;$(ROOT_DIR)/lua/?.so" LUA_PATH="./lua/?.lua;$(ROOT_DIR)/examples/?/init.lua;$(ROOT_DIR)/examples/nvlx/?.lua;;" $(NVIM_PATH) -u init.lua

debug:
	@LUA_CPATH="$(ROOT_DIR)/lua/?/init.so;$(ROOT_DIR)/lua/?.so" LUA_PATH="./lua/?.lua;$(ROOT_DIR)/examples/?/init.lua;$(ROOT_DIR)/examples/nvlx/?.lua;;" $(NVIM_PATH) -u init.lua --headless +q
