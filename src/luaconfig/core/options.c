#include "lua.h"
#include "options.h"
#include "luaconfig/utils/printstack.h"
#include "nvim.h"

void
nv_set_option (const char *name, const char *string, long num, int optflags)
{
    set_option_value (name, num, string, optflags);
}

void
l_set_options (lua_State *L)
{
    // stack = [nvlx, nvlx.options]
    lua_pushnil (L);
    // stack = [nvlx, nvlx.options, nil]
    while (lua_next (L, 2) != 0) {
        // stack = [nvlx, nvlx.options, key, value]
        const char *key = lua_tolstring (L, -2, 0);
        switch (lua_type (L, -1)) {
            case LUA_TNUMBER:
                nv_set_option (key, NULL, lua_tonumber (L, -1), OPT_BOTH);
                break;
            case LUA_TSTRING:
                nv_set_option (key, lua_tostring (L, -1), 0, OPT_BOTH);
                break;
            case LUA_TBOOLEAN:
                nv_set_option (key, NULL, lua_toboolean (L, -1), OPT_BOTH);
                break;
            default:
                break;
        }
        lua_pop (L, 1);
        // stack = [nvlx, nvlx.options, key]
    }
}

void
l_options_load (lua_State *L)
{
    // stack = [nvlx]
    lua_getfield (L, 1, "options");
    // stack = [nvlx, nvlx.options]
    l_set_options (L);
    lua_pop (L, 1);
    // stack = [nvlx]
}
