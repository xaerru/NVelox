#ifndef NVELOX_LOOP_H
#define NVELOX_LOOP_H

#include <nvim/main.h>

uv_loop_t *nv_uv_loop ();

void nv_schedule (argv_callback cb, int argc, ...);

#endif  // NVELOX_LOOP_H
