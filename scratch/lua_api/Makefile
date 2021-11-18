all: main

main:
	gcc applib/lib.c -fPIC -shared -o applib/app.so -llua
	gcc app/main.c -g -Wl,-E -ldl -o app/main
