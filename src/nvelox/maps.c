#include "maps.h"
#include <stdio.h>
#include <string.h>

int
get_mode_flag (const char modec)
{
    switch (modec) {
        case 'i':
            return INSERT;
        case 'c':
            return CMDLINE;
        case 'l':
            return LANGMAP;
        case 'n':
            return NORMAL;
        case 'o':
            return OP_PENDING;
        case 's':
            return SELECTMODE;
        case 't':
            return TERM_FOCUS;
        case 'v':
            return VISUAL + SELECTMODE;
        case 'x':
            return VISUAL;
        default:
            return VISUAL + SELECTMODE + NORMAL + OP_PENDING;  // Default for :map
    }
}

void
nv_set_keymap (const char *mode, const char *key, const char *value, bool noremap, bool forceit)
{
    int maptype = noremap == true ? 2 : 0;
    int mode_flag = get_mode_flag (mode[0]);
    char keymap[strlen (key) + strlen (value) + 2];
    snprintf ((char *)keymap, sizeof (keymap), "%s %s", key, value);
    do_map (maptype, (char *)keymap, mode_flag, forceit);
};
