#include "luajit/lua.h"
#include "options.h"
#include "luaconfig/utils/printstack.h"
#include "nvim.h"
#include <stdio.h>
#include <string.h>

int
get_mode_flag (const char modec)
{
    switch (modec) {
        case 'i':
            return INSERT;
        case 'c':
            return CMDLINE;
        case 'l':
            return LANGMAP;
        case 'n':
            return NORMAL;
        case 'o':
            return OP_PENDING;
        case 's':
            return SELECTMODE;
        case 't':
            return TERM_FOCUS;
        case 'v':
            return VISUAL + SELECTMODE;
        case 'x':
            return VISUAL;
        default:
            return VISUAL + SELECTMODE + NORMAL + OP_PENDING;  // Default for :map
    }
}

void
nv_set_keymap (const char *mode, const char *key, const char *value, bool noremap, bool forceit)
{
    int maptype = noremap == true ? 2 : 0;
    int mode_flag = get_mode_flag (mode[0]);
    char_u keymap[strlen (key) + strlen (value) + 2];
    snprintf ((char *)keymap, sizeof (keymap), "%s %s", key, value);
    do_map (maptype, (char_u *)keymap, mode_flag, forceit);
};

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
