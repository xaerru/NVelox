#include "message.h"
#include <string.h>

void
nv_out_msg (char *msg)
{
    // Keep only works if multiline is false
    msg_attr_keep(msg, 0, false, true);
}

void
nv_err_msg (char *msg)
{
    emsg_multiline(msg, true);
}
