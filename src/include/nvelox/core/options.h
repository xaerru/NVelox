#ifndef OPTION_H
#define OPTION_H

#include "luajit/lua.h"

void
lua_set_options (lua_State *L);

void
lua_options_load (lua_State *L);

#endif // OPTION_H
