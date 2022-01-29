#include <stdlib.h>
#include <stdbool.h>

typedef struct {
    char *data;
    size_t size;
} String;

extern void nvim_out_write (String str);
extern void nvim_err_write (String str);
extern int msg(char *s);
    // Keep only works if multiline is false
extern bool msg_attr_keep(const char *s, int attr, bool keep, bool multiline);
extern bool emsg(const char *s);

void nv_out_msg (char *msg);
void nv_err_msg (char *msg);
