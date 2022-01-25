#include "message.h"
#include "runtime.h"
#include <stdlib.h>

void
start_point ()
{
    const char *plugin_dir = getenv ("NVELOX_PLUGIN_DIR");
    if (!plugin_dir)
        load_plugins_from_dir ("/some/path");
    else
        load_plugins_from_dir (getenv ("NVELOX_PLUGIN_DIR"));
    nv_out_msg ("nvelox is loaded");
}
