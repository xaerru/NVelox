#include <luajit-2.1/lua.h>
#include "options.h"
#include "luaconfig/utils/printstack.h"
#include "nvelox/nvelox.h"
#include <stdio.h>
#include <string.h>

void
l_do_highlights (lua_State *L)
{
    lua_pushnil (L);
    while (lua_next (L, 2)) {
        nv_do_highlight(lua_tostring(L, -1), false);
        lua_pop (L, 1);
    }
}

void
l_highlights_load (lua_State *L)
{
    // stack = [nvlx]
    lua_getfield (L, 1, "highlights");
    // stack = [nvlx, nvlx.highlights]
    l_do_highlights (L);
    lua_pop (L, 1);
    // stack = [nvlx]
}
