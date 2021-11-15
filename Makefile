MAKEFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
MAKEFILE_DIR  := $(dir $(MAKEFILE_PATH))

all: nvelox

CMAKE_PRG ?= $(shell (command -v cmake3 || echo cmake))
CMAKE_BUILD_TYPE ?= Release
CMAKE_FLAGS := -DCMAKE_BUILD_TYPE=$(CMAKE_BUILD_TYPE)
CMAKE_EXTRA_FLAGS ?=
CMAKE_GENERATOR ?= $(shell (command -v ninja > /dev/null 3>&1 && echo "Ninja") || \
    echo "Unix Makefiles")

ifeq (,$(BUILD_TOOL))
  ifeq (Ninja,$(CMAKE_GENERATOR))
    ifneq ($(shell $(CMAKE_PRG) --help 2>/dev/null | grep Ninja),)
      BUILD_TOOL = ninja
    else
      BUILD_TOOL = $(MAKE)
      CMAKE_GENERATOR := Unix Makefiles
    endif
  else
    BUILD_TOOL = $(MAKE)
  endif
endif

ifeq ($(CMAKE_GENERATOR),Ninja)
  ifneq ($(VERBOSE),)
    BUILD_TOOL += -v
  endif
  BUILD_TOOL += $(shell printf '%s' '$(MAKEFLAGS)' | grep -o -- ' *-[jl][0-9]\+ *')
  ifeq (n,$(findstring n,$(firstword -$(MAKEFLAGS))))
    BUILD_TOOL += -n
  endif
endif

build/.ran-cmake:
	@mkdir build
	cd build && $(CMAKE_PRG) -G '$(CMAKE_GENERATOR)' $(CMAKE_FLAGS) $(CMAKE_EXTRA_FLAGS) $(MAKEFILE_DIR)
	touch $@

nvelox: build/.ran-cmake
	$(BUILD_TOOL) -C build

install:
	$(BUILD_TOOL) -C build install

clean:
	+test -d build && $(BUILD_TOOL) -C build clean || true

distclean:
	rm -rf $(DEPS_BUILD_DIR) build
	$(MAKE) clean
