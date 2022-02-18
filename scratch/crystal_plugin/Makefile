all: main

main:
	@mkdir -p build
	crystal build --single-module --link-flags="-shared" src/plugin.cr -o build/crystal-plugin.so

clean:
	@rm -rf build
