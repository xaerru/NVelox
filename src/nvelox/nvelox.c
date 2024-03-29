#include "dlfcn.h"
#include "message.h"
#include "runtime.h"
#include <stdlib.h>

int
nvelox_main ()
{
    nv_load_plugins ();
    nv_out_msg ("nvelox is loaded");
    return 0;
}

void
nvelox_quit_hook ()
{
    for (int i = 0; i < plugin_count; i++)
        dlclose (plugin_handles[i]);
    free (plugin_handles);
}
