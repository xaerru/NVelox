#include "luajit/lua.h"
#include "nvelox/core/options.h"
#include "nvim.h"

void
set_options (lua_State *L, int t)
{
    lua_pushnil (L);
    while (lua_next (L, t) != 0) {
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
    lua_pop(L, 3);
}
