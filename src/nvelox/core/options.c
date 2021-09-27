#include "luajit/lua.h"
#include "nvelox/core/options.h"
#include "nvelox/utils/printstack.h"
#include "nvim.h"

void
set_options (lua_State *L, int t)
{
    // stack = [nvlx, nvlx.options]
    lua_pushnil (L);
    // stack = [nvlx, nvlx.options, nil]
    while (lua_next (L, t) != 0) {
        // stack = [nvlx, nvlx.options, key, value]
        const char *key = lua_tolstring (L, -2, 0);
        switch (lua_type (L, -1)) {
            case LUA_TNUMBER:
                set_option_value (key, lua_tonumber (L, -1), NULL, 0);
                break;
            case LUA_TSTRING:
                set_option_value (key, 0, lua_tostring (L, -1), 0);
                break;
            case LUA_TBOOLEAN:
                set_option_value (key, lua_toboolean (L, -1), NULL, 0);
                break;
            default:
                break;
        }
        lua_pop (L, 1);
        // stack = [nvlx, nvlx.options, key]
    }
    print_stack (L);
}

void
options_load (lua_State *L)
{
    // stack = [nvlx]
    lua_getfield (L, 1, "options");
    // stack = [nvlx, nvlx.options]
    set_options (L, 2);
    lua_pop (L, 1);
    // stack = [nvlx]
}
