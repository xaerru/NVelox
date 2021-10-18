#include "luajit/lauxlib.h"
#include "luajit/lua.h"
#include "nvelox/core/autocmds.h"
#include "nvelox/core/highlights.h"
#include "nvelox/core/maps.h"
#include "nvelox/core/options.h"
#include "nvelox/utils/printstack.h"
#include "nvim.h"

int
setup (lua_State *L)
{
    // stack = [nvlx]
    options_load (L);
    maps_load (L);
    highlights_load (L);
    autocmds_load (L);
    uc_add_command ((char_u *)"Hello", 5, (char_u *)"echo 'helo'", EX_BANG | EX_EXTRA, -1, 0, 0,
                    (char_u *)"", ADDR_LINES, false);
    return 0;
}

LUA_API int
luaopen_nvelox_init (lua_State *L)
{
    luaL_Reg fns[] = { { "setup", setup }, { NULL, NULL } };
    luaL_newlib (L, fns);
    return 1;
}
