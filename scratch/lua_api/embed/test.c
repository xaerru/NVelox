#include <lauxlib.h>
#include <lua.h>
#include <luaconf.h>
#include <lualib.h>
#include <stdio.h>

void start_point()
{
    lua_State *L;
    L = luaL_newstate();
    luaL_openlibs(L);
    if (luaL_dofile(L, "test.lua"))
    {
        printf("Could not load file: %s", lua_tostring(L, -1));
        lua_close(L);
    }
    lua_close(L);
}
