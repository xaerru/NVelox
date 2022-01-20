#include "options.h"

void
nv_set_option (const char *name, const char *string, long num, int optflags)
{
    set_option_value (name, num, string, optflags);
}
