#include <stddef.h>
#include <stdio.h>
#include <stdbool.h>

typedef unsigned char char_u;

char* set_option_value(const char* const name,
                       const long number,
                       const char* const string,
                       const int opt_flags);

void options_load();

typedef struct {
    const char* const name;
    const long number;
    const char* const string;
    const int opt_flags;
} Option;

static const Option options[] = {
    {"clipboard", 0, "unnamedplus", 0},
    {"list", 1, NULL, 0},
    {"lcs", 0, "tab:>-,trail:-", 0},
};
