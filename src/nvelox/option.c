#include "option.h"
#include <nvim/api/options.h>

void
nv_set_option (String name, Object value, Dict(option) options)
{
    Error e;
    e.type=kErrorTypeNone;
    nvim_set_option_value(INTERNAL_CALL_MASK, name, value, &options, &e);
}
