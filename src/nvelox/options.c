#include <nvelox/config.def.h>

static void
set_options (const Option options[], int size)
{
    for (int i = size; i--;) {
        Option o = options[i];
        set_option_value (o.name, o.number, o.string, o.opt_flags);
    }
}

void
options_load ()
{
    set_options (options, sizeof (options) / sizeof (Option));
}
