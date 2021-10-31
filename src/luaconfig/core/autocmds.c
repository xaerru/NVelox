#include "lua.h"
#include "options.h"
#include "luaconfig/utils/printstack.h"
#include "nvelox/nvelox.h"
#include <stdio.h>
#include <string.h>

int
get_event (const char *name)
{
    for (int i = 0; event_names[i].len != 0; ++i) {
        if (strncmp (event_names[i].name, name, event_names[i].len) == 0) {
            return event_names[i].event;
        }
    }
    return NUM_EVENTS;
}

void nv_do_augroup(const char* name, int forceit){
    do_augroup((char_u*)name, forceit);
}

void
nv_do_autocmd (const char *event,
               const char *pattern,
               const char *command,
               bool once,
               int nested,
               int forceit,
               int group)
{
    do_autocmd_event (get_event (event), (char_u *)pattern, once, nested, (char_u *)command,
                      forceit, group);
};

void
l_set_autocmds (lua_State *L, int t)
{
    // stack = [nvlx, nvlx.autocmds]
    lua_pushnil (L);
    // stack = [nvlx, nvlx.autocmds, nil]
    while (lua_next (L, t) != 0) {
        // stack = [nvlx, nvlx.autocmds, augroup, autocmds]
        nv_do_augroup(lua_tostring(L, -2), 0);
        lua_pushnil (L);

        // stack = [nvlx, nvlx.autocmds, augroup, autocmds, nil]
        while (lua_next (L, 4) != 0) {
            // stack = [nvlx, nvlx.autocmds, augroup, autocmds, idx, autocmd table]
            lua_rawgeti (L, 6, 1);
            lua_rawgeti (L, 6, 2);
            lua_rawgeti (L, 6, 3);

            // stack = [nvlx, nvlx.autocmds, augroup, autocmds, idx, autocmd table, event(s),
            // pattern, cmd]
            nv_do_autocmd(lua_tostring(L, 7), lua_tostring(L, 8), lua_tostring(L, 9), false, false, false, -3);

            lua_pop (L, 4);
            // stack = [nvlx, nvlx.autocmds, augroup, autocmds, idx]
        }
        nv_do_augroup("end", 0);

        lua_pop (L, 1);
        // stack = [nvlx, nvlx.autocmds, augroup]
    }
}

void
l_autocmds_load (lua_State *L)
{
    // stack = [nvlx]
    lua_getfield (L, 1, "autocmds");
    // stack = [nvlx, nvlx.autocmds]
    l_set_autocmds (L, 2);
    lua_pop (L, 1);
    // stack = [nvlx]
}
