CC:=gcc
CFLAGS:=-Wall -Werror -fpic -std=gnu99 -Ofast -I../../src

TARGET:=../../lib/libnvelox.a

TARGET_DIR:=../../lib
BUILD_DIR:=../../build/src/nvelox
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

SOURCES:=$(shell cd ../../ && find src/nvelox -type f -name '*.c')
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
	ar rcs $@ $(OBJECTS)
