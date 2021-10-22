#include "luajit/lua.h"
#include "nvelox/core/options.h"
#include "nvelox/utils/printstack.h"
#include "nvim.h"
#include <stdio.h>
#include <string.h>

void
nv_do_highlight (const char *cmd, bool forceit)
{
    do_highlight (cmd, forceit, false);
}

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
