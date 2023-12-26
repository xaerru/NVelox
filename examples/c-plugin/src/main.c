#include <nvelox/nvelox.h>
#include <nvim/main.h>
#include <nvim/event/loop.h>
#include <nvim/event/multiqueue.h>
#include <nvim/api/private/defs.h>

void print_msg(void **argv) {
    char *str = argv[0];
    nv_out_msg(str);
}

int nvelox_plugin_init() {
    char *test_str = "multiqueue_put_event works";
    nv_schedule(print_msg, 1, test_str);
    String s = NvStr("cmdheight");
    Object v = NvObjInt(10);
    Object no = {.type=kObjectTypeNil};
    KeyDict_option kdo = {
        .buf = no,
        .win = no,
        .scope = no,
        .filetype = no
    };
    nv_set_option(s, v, kdo);
    return 0;
}
