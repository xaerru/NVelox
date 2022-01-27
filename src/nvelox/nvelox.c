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
