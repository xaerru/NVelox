// From https://gist.github.com/tylerneylon/5b9ab5ffcc616cd2a337

#include "luajit/lauxlib.h"
#include "nvelox/utils/printstack.h"
#include <assert.h>
#include <ctype.h>
#include <stdio.h>
#include <string.h>

static void print_item (lua_State *L, int i, int as_key);

static int
is_identifier (const char *s)
{
    while (*s) {
        if (!isalnum (*s) && *s != '_')
            return 0;
        ++s;
    }
    return 1;
}

static int
is_seq (lua_State *L, int i)
{
    // stack = [..]
    lua_pushnil (L);
    // stack = [.., nil]
    int keynum = 1;
    while (lua_next (L, i)) {
        // stack = [.., key, value]
        lua_rawgeti (L, i, keynum);
        // stack = [.., key, value, t[keynum]]
        if (lua_isnil (L, -1)) {
            lua_pop (L, 3);
            // stack = [..]
            return 0;
        }
        lua_pop (L, 2);
        // stack = [.., key]
        keynum++;
    }
    // stack = [..]
    return 1;
}

static void
print_seq (lua_State *L, int i)
{
    printf ("{");

    int k;
    for (k = 1;; ++k) {
        // stack = [..]
        lua_rawgeti (L, i, k);
        // stack = [.., t[k]]
        if (lua_isnil (L, -1))
            break;
        if (k > 1)
            printf (", ");
        print_item (L, -1, 0);  // 0 --> as_key
        lua_pop (L, 1);
        // stack = [..]
    }
    // stack = [.., nil]
    lua_pop (L, 1);
    // stack = [..]

    printf ("}");
}

static void
print_table (lua_State *L, int i)
{
    // Ensure i is an absolute index as we'll be pushing/popping things after it.
    if (i < 0)
        i = lua_gettop (L) + i + 1;

    const char *prefix = "{";
    if (is_seq (L, i)) {
        print_seq (L, i);  // This case includes all empty tables.
    } else {
        // stack = [..]
        lua_pushnil (L);
        // stack = [.., nil]
        while (lua_next (L, i)) {
            printf ("%s", prefix);
            // stack = [.., key, value]
            print_item (L, -2, 1);  // 1 --> as_key
            printf (" = ");
            print_item (L, -1, 0);  // 0 --> as_key
            lua_pop (L, 1);         // So the last-used key is on top.
                                    // stack = [.., key]
            prefix = ", ";
        }
        // stack = [..]
        printf ("}");
    }
}

static char *
get_fn_string (lua_State *L, int i)
{
    static char fn_name[1024];

    // Ensure i is an absolute index as we'll be pushing/popping things after it.
    if (i < 0)
        i = lua_gettop (L) + i + 1;

    // Check to see if the function has a global name.
    // stack = [..]
    lua_getglobal (L, "_G");
    // stack = [.., _G]
    lua_pushnil (L);
    // stack = [.., _G, nil]
    while (lua_next (L, -2)) {
        // stack = [.., _G, key, value]
        if (lua_rawequal (L, i, -1)) {
            snprintf (fn_name, 1024, "function:%s", lua_tostring (L, -2));
            lua_pop (L, 3);
            // stack = [..]
            return fn_name;
        }
        // stack = [.., _G, key, value]
        lua_pop (L, 1);
        // stack = [.., _G, key]
    }
    // If we get here, the function didn't have a global name; print a pointer.
    // stack = [.., _G]
    lua_pop (L, 1);
    // stack = [..]
    snprintf (fn_name, 1024, "function:%p", lua_topointer (L, i));
    return fn_name;
}

static void
print_item (lua_State *L, int i, int as_key)
{
    int ltype = lua_type (L, i);
    // Set up first, last and start and end delimiters.
    const char *first = (as_key ? "[" : "");
    const char *last = (as_key ? "]" : "");
    switch (ltype) {

        case LUA_TNIL:
            printf ("nil");  // This can't be a key, so we can ignore as_key here.
            return;

        case LUA_TNUMBER:
            printf ("%s%g%s", first, lua_tonumber (L, i), last);
            return;

        case LUA_TBOOLEAN:
            printf ("%s%s%s", first, lua_toboolean (L, i) ? "true" : "false", last);
            return;

        case LUA_TSTRING: {
            const char *s = lua_tostring (L, i);
            if (is_identifier (s) && as_key) {
                printf ("%s", s);
            } else {
                printf ("%s'%s'%s", first, s, last);
            }
        }
            return;

        case LUA_TTABLE:
            printf ("%s", first);
            print_table (L, i);
            printf ("%s", last);
            return;

        case LUA_TFUNCTION:
            printf ("%s%s%s", first, get_fn_string (L, i), last);
            return;

        case LUA_TUSERDATA:
        case LUA_TLIGHTUSERDATA:
            printf ("%suserdata:", first);
            break;

        case LUA_TTHREAD:
            printf ("%sthread:", first);
            break;

        default:
            printf ("<internal_error_in_print_stack_item!>");
            return;
    }

    // If we reach here, then we've got a type that we print as a pointer.
    printf ("%p%s", lua_topointer (L, i), last);
}

void
print_stack (lua_State *L)
{
    int n = lua_gettop (L);
    printf ("stack:");
    int i;
    for (i = 1; i <= n; ++i) {
        printf ("\n\n%d\n", i);
        print_item (L, i, 0);  // 0 --> as_key
    }
    if (n == 0)
        printf (" <empty>");
    printf ("\n");
}
