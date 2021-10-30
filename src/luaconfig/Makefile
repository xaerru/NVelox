CC:=gcc
CFLAGS:=-Wall -Werror -fpic -std=gnu99 -Ofast -I../../src -Iluajit -I../include

TARGET:=../../lua/nvelox.so

TARGET_DIR:=../../lua
BUILD_DIR:=../../build/src/luaconfig
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

SOURCES:=$(shell cd ../../ && find src/luaconfig -type f -name '*.c')
OBJECTS:= $(patsubst %.c,../../build/%.o, $(SOURCES))
HEADERS:= $(shell find . -type f -name '*.h')

.PHONY: default all
.PRECIOUS: $(TARGET) $(OBJECTS)

default: $(TARGET)
all: default

$(BUILD_DIR)/%.o: %.c $(HEADERS)
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

$(TARGET): $(OBJECTS)
	@mkdir -p $(TARGET_DIR)
	$(CC) $(OBJECTS) $(CFLAGS) -L../../lib/ -lnvelox -shared -o $@
