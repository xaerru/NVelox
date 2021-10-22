#include "luajit/lauxlib.h"
#include "luajit/lua.h"
#include "nvelox/core/autocmds.h"
#include "nvelox/core/commands.h"
#include "nvelox/core/highlights.h"
#include "nvelox/core/maps.h"
#include "nvelox/core/options.h"
#include "nvelox/utils/printstack.h"
#include "nvim.h"

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
luaopen_nvelox_init (lua_State *L)
{
    luaL_Reg fns[] = { { "setup", lua_setup }, { NULL, NULL } };
    luaL_newlib (L, fns);
    return 1;
}
