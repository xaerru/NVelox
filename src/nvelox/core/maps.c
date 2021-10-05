#include "luajit/lua.h"
#include "nvelox/core/options.h"
#include "nvelox/utils/printstack.h"
#include "nvim.h"
#include <stdio.h>
#include <string.h>

void
set_mode_maps (lua_State *L)
{
    /*const char* mode = lua_tostring(L, 3);*/
    /*const char modec = mode[0];*/
    lua_pushnil(L);
    while(lua_next(L, 4) != 0) {
        const char* key = lua_tostring(L, -2);
        const char* value = lua_tostring(L, -1);
        printf("%s = %s\n", key, value);
        lua_pop(L, 1);
    }
}

void
set_maps (lua_State *L, int t)
{
    // stack = [nvlx, nvlx.maps]
    lua_pushnil (L);
    // stack = [nvlx, nvlx.maps, nil]
    while (lua_next (L, t) != 0) {
        // stack = [nvlx, nvlx.maps, mode, table of maps]
        set_mode_maps(L);
        lua_pop (L, 1);
        // stack = [nvlx, nvlx.maps, key]
    }
}

void
maps_load (lua_State *L)
{
    // stack = [nvlx]
    lua_getfield (L, 1, "maps");
    // stack = [nvlx, nvlx.maps]
    set_maps (L, 2);
    lua_pop (L, 1);
    // stack = [nvlx]
}
