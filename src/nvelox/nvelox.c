#include "dlfcn.h"
#include "message.h"
#include "runtime.h"
#include <stdlib.h>

int
start_point ()
{
    nv_load_plugins ();
    nv_out_msg ("nvelox is loaded");
    return 0;
}

int nvelox_quit_hook() {
    while(nvelox_plugin_count--) 
        dlclose(nvelox_plugin_handles[nvelox_plugin_count]);
    free(nvelox_plugin_handles);
    return 0;
}
