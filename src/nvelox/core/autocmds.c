#include "luajit/lua.h"
#include "nvelox/core/options.h"
#include "nvelox/utils/printstack.h"
#include "nvim.h"
#include <stdio.h>
#include <string.h>

event_T
get_event (const char *name)
{
    int i;

    for (i = 0; event_names[i].name != NULL; i++) {
        /*printf ("%s: %s\n", event_names[i].name, name);*/
        if (strncmp (event_names[i].name, name, event_names[i].len)) {
            printf ("%d\n", event_names[i].event);
            return event_names[i].event;
        }
    }
    return NUM_EVENTS;
}

void
set_autocmds (lua_State *L, int t)
{
    // stack = [nvlx, nvlx.options]
    lua_pushnil (L);
    // stack = [nvlx, nvlx.options, nil]
    while (lua_next (L, t) != 0) {
        // stack = [nvlx, nvlx.options, key, value]
        const char *augroup = lua_tolstring (L, -2, 0);
        do_augroup((char_u*)augroup, 0);
        printf ("%s\n", augroup);

        /*lua_pushnil(L);*/
        lua_pushnil (L);
        /*print_stack (L);*/
        while (lua_next (L, 4) != 0) {
            lua_pushnil (L);
            while (lua_next (L, 6) != 0) {
                lua_rawgeti (L, 6, 2);
                lua_rawgeti (L, 6, 3);
                print_stack (L);
                lua_pop (L, 3);
            }
            lua_pop (L, 1);
        }
        lua_pop (L, 1);
        do_augroup((char_u*)"end", 0);
        // stack = [nvlx, nvlx.options, key]
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
