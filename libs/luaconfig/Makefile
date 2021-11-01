CC:=gcc
CFLAGS:=-Wall -Werror -fPIC -std=gnu99 -Ofast -I../../libs -Iluajit -I$${HOME}/.local/include

TARGET:=../../lua/nvelox.so
LIB_PATH:=$${HOME}/.local/lib

TARGET_DIR:=../../lua
BUILD_DIR:=../../build/libs/luaconfig
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

SOURCES:=$(shell cd ../../ && find libs/luaconfig -type f -name '*.c')
OBJECTS:= $(patsubst %.c,../../build/%.o, $(SOURCES))
HEADERS:= $(shell find . -type f -name '*.h')

.PHONY: default all clean
.PRECIOUS: $(TARGET) $(OBJECTS)

default: $(TARGET)
all: default

$(BUILD_DIR)/%.o: %.c $(HEADERS)
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

$(TARGET): $(OBJECTS)
	@mkdir -p $(TARGET_DIR)
	$(CC) $(OBJECTS) $(CFLAGS) -Wl,-rpath=$(LIB_PATH) -L$(LIB_PATH) -lnvelox -shared -o $@

clean:
	rm $(TARGET)
