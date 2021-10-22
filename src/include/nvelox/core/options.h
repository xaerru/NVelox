#ifndef OPTION_H
#define OPTION_H

#include "luajit/lua.h"

void
set_options (lua_State *L);

void
options_load (lua_State *L);

typedef struct {
    const char* const name;
    const long number;
    const char* const string;
    const int opt_flags;
} Option;

#endif // OPTION_H
