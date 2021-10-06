#ifndef MAPS_H
#define MAPS_H

#include "luajit/lua.h"

void set_maps(lua_State* L, int t);

void maps_load(lua_State* L);

#endif  // MAPS_H
