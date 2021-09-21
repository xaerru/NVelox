#include <nvelox/options.h>

void
luaopen__nvlx_build_init ()
{
    options_load ();
}
