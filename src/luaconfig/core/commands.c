#include "lua.h"
#include "options.h"
#include "luaconfig/utils/printstack.h"
#include "nvim.h"
#include <stdio.h>
#include <string.h>

// TODO: Add more options
void
nv_def_command (const char *name, const char *cmd, int forceit)
{
    uc_add_command ((char_u *)name, strlen (name), (char_u *)cmd, EX_BANG | EX_EXTRA, -1, 0, 0,
                    (char_u *)"", ADDR_LINES, forceit);
}

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
