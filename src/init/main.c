#include "luajit/lauxlib.h"
#include "luajit/lua.h"
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
    do_augroup((char_u*)"bruh", 0);
    /*do_autocmd((char_u*)"bufread,bufenter * set filetype=bruh", 0);*/
    do_autocmd_event(EVENT_BUFENTER, (char_u*)"*", false, false, (char_u*)"set cmdheight=5", false, -3);
    do_augroup((char_u*)"end", 0);
    return 0;
}

LUA_API int
luaopen_nvelox_init (lua_State *L)
{
    luaL_Reg fns[] = { { "setup", setup }, { NULL, NULL } };
    luaL_newlib (L, fns);
    return 1;
}
