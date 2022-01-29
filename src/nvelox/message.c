#include "message.h"
#include <string.h>

void
nv_out_msg (char *msg)
{
    msg_attr_keep(msg, 0, true, false);
}

void
nv_err_msg (char *msg)
{
    nvim_err_write ((String){ .data = msg, .size = strlen (msg) });
    nvim_err_write ((String){ .data = "\n", .size = 1 });
}
