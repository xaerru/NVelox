#ifndef MAPS_H
#define MAPS_H

#include "lua.h"

void l_set_maps(lua_State* L, int t);

void l_maps_load(lua_State* L);

#endif  // MAPS_H