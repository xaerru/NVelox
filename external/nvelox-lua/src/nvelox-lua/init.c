#include <luajit-2.1/lauxlib.h>
#include <luajit-2.1/lua.h>
#include <luajit-2.1/luaconf.h>
#include <nvelox/nvelox.h>
#include <stdio.h>
#include <stdlib.h>

int
set_option (lua_State *L)
{
    const char *key = luaL_checkstring (L, 1);
    int value = luaL_checknumber (L, 1);
    nv_set_option (key, value, 0, OPT_BOTH);
    return 0;
}

LUA_API int
luaopen_nvelox (lua_State *L)
{
    luaL_Reg fns[] = { { "set", set_option }, { NULL, NULL } };
    luaL_newlib (L, fns);
    return 1;
}
