#ifndef NVELOX_H
#define NVELOX_H

#include <nvim/main.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

void nv_set_option (const char *name, const char *string, long num, int optflags);

void nv_schedule (argv_callback cb, int argc, ...);

#define OPT_BOTH 0
#define OPT_GLOBAL 2
#define OPT_LOCAL 4

void nv_do_autocmd (const char *event,
                    const char *pattern,
                    const char *command,
                    bool once,
                    int nested,
                    int forceit,
                    int group);

void nv_do_augroup (const char *name, int forceit);

void nv_set_keymap (const char *mode,
                    const char *key,
                    const char *value,
                    bool noremap,
                    bool forceit);

void nv_do_highlight (const char *cmd, bool forceit);

void nv_def_command (const char *name, const char *cmd, int forceit);

void nv_out_msg (char *msg);
void nv_err_msg (char *msg);

#endif  // NVELOX_H
