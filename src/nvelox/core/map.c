#include "luajit/lua.h"
#include "nvelox/core/options.h"
#include "nvelox/utils/printstack.h"
#include "nvim.h"
#include <stdio.h>
#include <string.h>

void
set_maps (lua_State *L, int t)
{
    // stack = [nvlx, nvlx.maps, nvlx.maps.general]
    lua_pushnil (L);
    // stack = [nvlx, nvlx.maps, nvlx.maps.general, nil]
    while (lua_next (L, t) != 0) {
        // stack = [nvlx, nvlx.maps, nvlx.maps.general, key, value]
        const char *mode = lua_tolstring (L, -2, 0);
        if (strcmp (mode, "insert") == 0) {
            lua_pushnil (L);
            while (lua_next (L, 5) != 0) {
                lua_rawgeti (L, -1, 1);
                lua_rawgeti (L, -2, 2);
                print_stack (L);
                lua_pop (L, 3);
            }
            break;
        }
        lua_pop (L, 1);
        // stack = [nvlx, nvlx.maps, nvlx.maps.general, key]
    }
}

void
maps_load (lua_State *L)
{
    // stack = [nvlx]
    lua_getfield (L, 1, "maps");
    // stack = [nvlx, nvlx.maps]
    lua_getfield (L, 2, "general");
    // stack = [nvlx, nvlx.maps, nvlx.maps.general]
    set_maps (L, 3);
    lua_pop (L, 2);
    // stack = [nvlx]
}
