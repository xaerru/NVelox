#include <luajit-2.1/lauxlib.h>
#include <luajit-2.1/lua.h>
#include "autocmds.h"
#include "commands.h"
#include "highlights.h"
#include "maps.h"
#include "options.h"
#include "printstack.h"
#include "nvelox/nvelox.h"
#include <stdio.h>

int
lua_setup (lua_State *L)
{
    // stack = [nvlx]
    l_options_load (L);
    l_maps_load (L);
    l_highlights_load (L);
    l_autocmds_load (L);
    l_commands_load (L);
    return 0;
}

LUA_API int
luaopen_nvelox (lua_State *L)
{
    luaL_Reg fns[] = { { "setup", lua_setup }, { NULL, NULL } };
    luaL_newlib (L, fns);
    return 1;
}
