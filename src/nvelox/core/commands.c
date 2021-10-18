#include "luajit/lua.h"
#include "nvelox/core/options.h"
#include "nvelox/utils/printstack.h"
#include "nvim.h"
#include <stdio.h>
#include <string.h>

void
set_commands (lua_State *L)
{
    lua_pushnil (L);
    while (lua_next (L, 2)) {
        char_u* name = (char_u*)lua_tostring(L, -2);
        uc_add_command (name, strlen((char*)name), (char_u *)lua_tostring(L, -1),
                        EX_BANG | EX_EXTRA, -1, 0, 0, (char_u *)"", ADDR_LINES, false);
        lua_pop (L, 1);
    }
}

void
commands_load (lua_State *L)
{
    // stack = [nvlx]
    lua_getfield (L, 1, "commands");
    // stack = [nvlx, nvlx.commands]
    set_commands (L);
    lua_pop (L, 1);
    // stack = [nvlx]
}
