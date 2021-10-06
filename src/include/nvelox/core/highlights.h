#ifndef HIGHLIGHTS_H
#define HIGHLIGHTS_H

#include "luajit/lua.h"

void set_highlights(lua_State* L);

void highlights_load(lua_State* L);

#endif  // HIGHLIGHTS_H
