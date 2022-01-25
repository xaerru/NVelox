#include "message.h"
#include "runtime.h"
#include <stdlib.h>

void
start_point ()
{
    nv_load_plugins ();
    nv_out_msg ("nvelox is loaded");
}
