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
        // stack = [nvlx, nvlx.maps, nvlx.maps.general, mode, table of maps]
        const char *mode = lua_tolstring (L, -2, 0);
        if (strcmp (mode, "insert") == 0) {
            lua_pushnil (L);
            // Iterating through table of maps
            while (lua_next (L, 5) != 0) {
                // Push key and action to the stack
                // stack = [nvlx, nvlx.maps, nvlx.maps.general, mode, table of maps, index, single map table]
                lua_rawgeti (L, -1, 1);
                lua_rawgeti (L, -2, 2);
                // stack = [nvlx, nvlx.maps, nvlx.maps.general, mode, table of maps, index, single map table, key, action]

                const char *action = lua_tostring (L, -1);
                const char *key = lua_tostring (L, -2);

                char map[sizeof (key) + sizeof (action)];
                strcpy (map, key);
                strcat (map, " ");
                strcat (map, action);

                printf ("%s\n", map);
                lua_pop (L, 3);
                // stack = [nvlx, nvlx.maps, nvlx.maps.general, mode, table of maps, index]
            }
            // TODO: add support for more modes
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
