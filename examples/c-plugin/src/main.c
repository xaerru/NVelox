#include <nvelox/nvelox.h>
#include <nvim/main.h>
#include <nvim/event/loop.h>
#include <nvim/event/multiqueue.h>

void print_msg(void **argv) {
    char *str = argv[0];
    nv_out_msg(str);
}

int nvelox_plugin_init() {
    char *test_str = "multiqueue_put_event works";
    multiqueue_put_event(main_loop.events, event_create(print_msg, 1, test_str));
    return 0;
}
