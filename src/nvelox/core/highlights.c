#include "luajit/lua.h"
#include "nvelox/core/options.h"
#include "nvelox/utils/printstack.h"
#include "nvim.h"
#include <stdio.h>
#include <string.h>

void
set_highlights (lua_State *L)
{
    lua_pushnil (L);
    while (lua_next (L, 2)) {
        print_stack(L);
        do_highlight (lua_tostring (L, -1), false, false);
        lua_pop(L, 1);
    }
}

void
highlights_load (lua_State *L)
{
    // stack = [nvlx]
    lua_getfield (L, 1, "highlights");
    // stack = [nvlx, nvlx.highlights]
    set_highlights (L);
    lua_pop (L, 1);
    // stack = [nvlx]
}
