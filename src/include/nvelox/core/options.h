#ifndef OPTION_H
#define OPTION_H

#include "luajit/lauxlib.h"
#include "luajit/lua.h"
#include "luajit/luaconf.h"

typedef unsigned char char_u;

char* set_option_value(const char* const name,
                       const long number,
                       const char* const string,
                       const int opt_flags);

void
print_table (lua_State *L, int t);

void
options_load (lua_State *L);

typedef struct {
    const char* const name;
    const long number;
    const char* const string;
    const int opt_flags;
} Option;

#endif // OPTION_H
