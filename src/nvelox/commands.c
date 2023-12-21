#include "commands.h"
#include <string.h>

void
nv_def_command (const char *name, const char *cmd, int forceit)
{
    uc_add_command ((char *)name, strlen (name), (char *)cmd, EX_BANG | EX_EXTRA, -1, 0, 0,
                    (char *)"", ADDR_LINES, forceit);
}
