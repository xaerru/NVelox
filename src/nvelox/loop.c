#include <nvim/event/defs.h>
#include <nvim/main.h>

uv_loop_t *
nv_uv_loop ()
{
    return &main_loop.uv;
}

void
nv_schedule (argv_callback cb, int argc, ...)
{
    assert (argc <= EVENT_HANDLER_MAX_ARGC);
    Event event;
    VA_EVENT_INIT (&event, cb, argc);
    multiqueue_put_event (main_loop.events, event);
}
