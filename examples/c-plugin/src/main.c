#include <nvelox/nvelox.h>
#include <nvim/main.h>
#include <nvim/event/loop.h>
#include <nvim/event/multiqueue.h>

int nvelox_plugin_init() {
    nv_out_msg ("This is an example C plugin.");
    return 0;
}
