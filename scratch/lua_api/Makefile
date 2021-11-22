all: main

main:
	@mkdir build
	@mkdir lib
	gcc lua_lib/libadd.c -fPIC -shared -llua -o lib/add.so
	gcc embed/test.c -fPIC -shared -llua -o lib/lua.so
	gcc app/main.c -g -Wl,-E -ldl -o build/main

clean:
	@rm -rf build lib main
