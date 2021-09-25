#include "luajit/lauxlib.h"
#include "luajit/lua.h"
#include "luajit/luaconf.h"
#include "nvim.h"
#include <nvelox/core/options.h>

void
set_options (lua_State *L, int t)
{
    lua_pushnil (L);
    while (lua_next (L, t) != 0) {
        if (lua_type (L, -1) == LUA_TNUMBER) {
            set_option_value (lua_tostring (L, -2), lua_tonumber (L, -1), NULL, 0);
        } else if (lua_type (L, -1) == LUA_TSTRING) {
            set_option_value (lua_tostring (L, -2), 0, lua_tostring (L, -1), 0);
        } else if (lua_type (L, -1) == LUA_TBOOLEAN) {
            set_option_value (lua_tostring (L, -2), lua_toboolean (L, -1), NULL, 0);
        }
        lua_pop (L, 1);
    }
}

void
options_load (lua_State *L)
{
    lua_getglobal (L, "require");
    lua_pushstring (L, "_nvlx.config.core");
    lua_call (L, 1, 1);
    lua_getfield (L, 2, "options");
    set_options (L, 3);
}
