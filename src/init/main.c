#include "luajit/lauxlib.h"
#include "luajit/lua.h"
#include "nvelox/core/options.h"
#include "nvelox/utils/printstack.h"

int
setup (lua_State *L)
{
    options_load (L);
    return 0;
}

LUA_API int
luaopen__nvlx_build_init (lua_State *L)
{
    luaL_Reg fns[] = { { "setup", setup }, { NULL, NULL } };
    luaL_newlib (L, fns);
    return 1;
}
