all: main

main:
	@mkdir -p build
	cpp code/test.c -o build/test.i
	lua src/generate.lua code/test.c build/static.h build/non_static.h build/test.i

clean:
	@rm -rf build
