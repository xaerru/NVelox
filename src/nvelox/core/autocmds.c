#include "luajit/lua.h"
#include "nvelox/core/options.h"
#include "nvelox/utils/printstack.h"
#include "nvim.h"
#include <stdio.h>
#include <string.h>

int
get_event (char *name)
{
    for (int i = 0; event_names[i].len != 0; ++i) {
        if (strncmp (event_names[i].name, name, event_names[i].len) == 0) {
            return event_names[i].event;
        }
    }
    return NUM_EVENTS;
}

void
set_autocmds (lua_State *L, int t)
{
    // stack = [nvlx, nvlx.autocmds]
    lua_pushnil (L);
    // stack = [nvlx, nvlx.autocmds, nil]
    while (lua_next (L, t) != 0) {
        // stack = [nvlx, nvlx.autocmds, augroup, autocmds]
        do_augroup ((char_u *)lua_tostring(L, -2), 0);
        lua_pushnil (L);

        // stack = [nvlx, nvlx.autocmds, augroup, autocmds, nil]
        while (lua_next (L, 4) != 0) {
            // stack = [nvlx, nvlx.autocmds, augroup, autocmds, idx, autocmd table]
            lua_rawgeti (L, 6, 1);
            lua_rawgeti (L, 6, 2);
            lua_rawgeti (L, 6, 3);

            // stack = [nvlx, nvlx.autocmds, augroup, autocmds, idx, autocmd table, event(s),
            // pattern, cmd]
            char *event = (char*)lua_tostring (L, 7);
            char_u *pat = (char_u *)lua_tostring (L, 8);
            char_u *cmd = (char_u *)lua_tostring (L, 9);

            do_autocmd_event (get_event (event), pat, false, false, cmd, false, -3);

            lua_pop (L, 4);
            // stack = [nvlx, nvlx.autocmds, augroup, autocmds, idx]
        }
        do_augroup ((char_u *)"end", 0);

        lua_pop (L, 1);
        // stack = [nvlx, nvlx.autocmds, augroup]
    }
}

void
autocmds_load (lua_State *L)
{
    // stack = [nvlx]
    lua_getfield (L, 1, "autocmds");
    // stack = [nvlx, nvlx.autocmds]
    set_autocmds (L, 2);
    lua_pop (L, 1);
    // stack = [nvlx]
}
