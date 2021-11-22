// example.c
//
// An example Lua module written in C.
//

#include <lauxlib.h>
#include <lua.h>
#include <lualib.h>

int add1(int a);

int add1_lua(lua_State* L) {
    int a = luaL_checkinteger(L, 1);
    lua_pushinteger(L, add1(a));
    return 1;
}

LUA_API int luaopen_lib_add(lua_State* L) {
    static luaL_Reg fns[] = {{"add1", add1_lua}, {NULL, NULL}};
    luaL_newlib(L, fns);
    return 1;
}
