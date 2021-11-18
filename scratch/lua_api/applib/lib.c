#include <lauxlib.h>
#include <lua.h>
#include <luaconf.h>
#include <lualib.h>
#include <stdio.h>

extern int add1(int a);

int add1_lua(lua_State *L)
{
    int a = luaL_checkinteger(L, 1);
    lua_pushinteger(L, add1(a));
    return 1;
}

int luaopen_app(lua_State *L)
{
    static luaL_Reg fns[] = {{"multiply", add1_lua}, {NULL, NULL}};
    luaL_newlib(L, fns);
    return 1;
}

void start_point()
{
    lua_State *L;
    L = luaL_newstate();
    luaL_openlibs(L);
    lua_pushcfunction(L, add1_lua);
    lua_setglobal(L, "add1");
    if (luaL_dofile(L, "applib/test.lua"))
    {
        printf("Could not load file: %sn", lua_tostring(L, -1));
        lua_close(L);
    }
    /*lua_pushnumber(L, 68);*/
    /*lua_call(L, 1, 1);*/
    /*lua_Number a = luaL_checknumber(L, -1);*/
    /*printf("%f\n", a);*/

    lua_close(L);
}
