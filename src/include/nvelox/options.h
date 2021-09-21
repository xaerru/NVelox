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
    {"autoindent", 1, NULL, 0},
    {"autoread", 1, NULL, 0},
    {"backspace", 0, "indent,eol,start", 0},
    {"clipboard", 0, "unnamedplus", 0},
    {"cmdheight", 2, NULL, 0},
    {"completeopt", 0, "menuone,noselect", 0},
    {"encoding", 0, "utf-8", 0},
    {"expandtab", 1, NULL, 0},
    {"fileencoding", 0, "utf-8", 0},
    {"hidden", 1, NULL, 0},
    {"hlsearch", 1, NULL, 0},
    {"ignorecase", 1, NULL, 0},
    {"inccommand", 0, "nosplit", 0},
    {"lazyredraw", 1, NULL, 0},
    {"linebreak", 1, NULL, 0},
    {"mouse", 0, "a", 0},
    {"number", 1, NULL, 0},
    {"pumheight", 10, NULL, 0},
    {"ruler", 1, NULL, 0},
    {"scrolloff", 8, NULL, 0},
    {"shiftwidth", 4, NULL, 0},
    {"shortmess", 0, "ifncTFtOolxI", 0},
    {"showmode", 0, NULL, 0},
    {"showtabline", 2, NULL, 0},
    {"sidescrolloff", 8, NULL, 0},
    {"signcolumn", 0, "yes", 0},
    {"smartcase", 1, NULL, 0},
    {"smartindent", 1, NULL, 0},
    {"smarttab", 1, NULL, 0},
    {"splitbelow", 1, NULL, 0},
    {"splitright", 1, NULL, 0},
    {"tabstop", 8, NULL, 0},
    {"termguicolors", 1, NULL, 0},
    {"timeoutlen", 150, NULL, 0},
    {"title", 1, NULL, 0},
    {"titlelen", 70, NULL, 0},
    {"titlestring", 0, " %F - NVelox", 0},
    {"undofile", 1, NULL, 0},
    {"undolevels", 1000, NULL, 0},
    {"undoreload", 10000, NULL, 0},
    {"updatetime", 0, NULL, 0},
    {"wrap", 0, NULL, 0},
};
