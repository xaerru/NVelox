#include <luajit-2.1/lua.h>
#include "options.h"
#include "printstack.h"
#include "nvelox/nvelox.h"
#include <stdio.h>
#include <string.h>

void
l_set_commands (lua_State *L)
{
    lua_pushnil (L);
    while (lua_next (L, 2)) {
        nv_def_command (lua_tostring (L, -2), lua_tostring (L, -1), false);
        lua_pop (L, 1);
    }
}

void
l_commands_load (lua_State *L)
{
    // stack = [nvlx]
    lua_getfield (L, 1, "commands");
    // stack = [nvlx, nvlx.commands]
    l_set_commands (L);
    lua_pop (L, 1);
    // stack = [nvlx]
}
