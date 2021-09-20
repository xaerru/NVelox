#include <nvelox/options.h>

void
luaopen_build_init ()
{
    options_load ();
}
