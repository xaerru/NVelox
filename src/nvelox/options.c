#include "options.h"
#include <stdlib.h>

void
nv_set_option (const char *name, const char *string, long num, int optflags)
{
    set_option_value (name, num, string, optflags);
}

void start_point(){
  nv_set_option("cmdheight", NULL, 2, 0);
}
