#include "autocmds.h"
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
