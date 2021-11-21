all: main

main:
	@mkdir build
	@mkdir lib
	gcc embed/test.c -fPIC -shared -llua -o lib/app.so
	gcc app/main.c -g -Wl,-E -ldl -o ./main

clean:
	@rm -rf build lib main
