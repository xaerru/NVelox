#include "lua.h"
#include "options.h"
#include "luaconfig/utils/printstack.h"
#include "nvelox/nvelox.h"
#include <stdio.h>
#include <string.h>

void
l_set_maps (lua_State *L, int t)
{
    // stack = [nvlx, nvlx.maps]
    lua_pushnil (L);
    // stack = [nvlx, nvlx.maps, nil]
    while (lua_next (L, t) != 0) {
        // stack = [nvlx, nvlx.maps, mode, table of maps]
        const char *mode = lua_tostring (L, 3);
        lua_pushnil (L);
        while (lua_next (L, 4) != 0) {
            nv_set_keymap (mode, lua_tostring (L, -2), lua_tostring (L, -1), true, false);
            lua_pop (L, 1);
        }
        lua_pop (L, 1);
        // stack = [nvlx, nvlx.maps, key]
    }
}

void
l_maps_load (lua_State *L)
{
    // stack = [nvlx]
    lua_getfield (L, 1, "maps");
    // stack = [nvlx, nvlx.maps]
    l_set_maps (L, 2);
    lua_pop (L, 1);
    // stack = [nvlx]
}
