#include "message.h"
#include <string.h>

void nv_out_msg(char* msg) {
    nvim_out_write((String){.data=msg, .size=strlen(msg)});
    nvim_out_write((String) { .data = "\n", .size = 1 });
}

void nv_err_msg(char* msg) {
    nvim_err_write((String){.data=msg, .size=strlen(msg)});
    nvim_err_write((String) { .data = "\n", .size = 1 });
}
