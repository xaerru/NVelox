#include "message.h"
#include <string.h>

void
nv_out_msg (char *_msg)
{
    msg(_msg);
}

void
nv_err_msg (char *_msg)
{
    emsg(_msg);
}
