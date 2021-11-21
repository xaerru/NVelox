#include <dlfcn.h>
#include <stdio.h>
#include <stdlib.h>

int add1(int a) { return a + 1; }

int main()
{
    void *handle = dlopen("lib/app.so", RTLD_LAZY);
    if (!handle)
    {
        fprintf(stderr, "%s\n", dlerror());
        exit(EXIT_FAILURE);
    }
    dlerror();
    void (*func)() = dlsym(handle, "start_point");

    char *error = dlerror();
    if (error != NULL)
    {
        fprintf(stderr, "%s\n", error);
        exit(EXIT_FAILURE);
    }
    func();
    return 0;
}
