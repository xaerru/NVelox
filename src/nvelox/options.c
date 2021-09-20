#include <nvelox/options.h>

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
    int size = sizeof (options) / sizeof (Option);
    set_options (options, size);
}
