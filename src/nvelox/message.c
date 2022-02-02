#include "message.h"
#include <string.h>

void
nv_out_msg (char *_msg)
{
    msg_attr_keep(_msg, 0, true, false);
}

void
nv_err_msg (char *_msg)
{
    emsg_multiline(_msg, true);
}
