#include "luajit/lauxlib.h"
#include "luajit/lua.h"
#include "luajit/luaconf.h"
#include <nvelox/options.h>
#include <stdlib.h>

void
set_options (lua_State *L, int t)
{
    lua_pushnil (L);
    while (lua_next (L, t) != 0) {
        // uses 'key' (at index -2) and 'value' (at index -1)
        set_option_value(lua_tostring(L, -2), lua_toboolean(L, -1), NULL, 0);
        // removes 'value'; keeps 'key' for next iteration
        lua_pop (L, 1);
    }
}

void
options_load (lua_State *L)
{
    lua_getglobal(L, "require");
    lua_pushstring(L, "_nvlx.config.core");
    lua_call(L, 1, 1);
    lua_getfield (L, 2, "options");
    set_options(L, 3);
}
