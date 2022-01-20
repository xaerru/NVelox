#include <stdlib.h>

typedef struct {
    char* data;
    size_t size;
} String;

extern void nvim_out_write(String str);
extern void nvim_err_write(String str);

void nv_out_msg(char* msg);
void nv_err_msg(char* msg);
