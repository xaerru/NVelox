#include "luajit/lauxlib.h"
#include "luajit/lua.h"
#include "luajit/luaconf.h"
#include "nvelox/core/options.h"

LUA_API int
luaopen__nvlx_build_init (lua_State *L)
{
    options_load(L);
    return 0;
}
