#include <stdlib.h>
#include <stdbool.h>

typedef struct {
    char *data;
    size_t size;
} String;

extern void nvim_out_write (String str);
extern void nvim_err_write (String str);
extern int msg(char *s);
extern bool msg_attr_keep(const char *s, int attr, bool keep, bool multiline);
extern bool emsg_multiline(const char *s, bool multiline);

void nv_out_msg (char *msg);
void nv_err_msg (char *msg);
