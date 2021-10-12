#ifndef NVIM_H
#define NVIM_H

#include <stdbool.h>
#include <stdlib.h>

// Flags for modes
#define NORMAL 0x01
#define SELECTMODE 0x1000
#define TERM_FOCUS 0x2000
#define VISUAL 0x02
#define OP_PENDING 0x04
#define CMDLINE 0x08
#define INSERT 0x10
#define LANGMAP 0x20

// Shorthand for unsigned variables. Many systems, but not all, have u_char
// already defined, so we use char_u to avoid trouble.
typedef unsigned char char_u;

typedef struct {
    char* data;
    size_t size;
} String;

/// Writes a message to the Vim error buffer. Does not append "\n", the
/// message is buffered (won't display) until a linefeed is written.
///
/// @param str Message
extern void nvim_err_write(String str);

/// Set the value of an option
///
/// @param[in]  name  Option name.
/// @param[in]  number  New value for the number or boolean option.
/// @param[in]  string  New value for string option.
/// @param[in]  opt_flags  Flags: OPT_LOCAL, OPT_GLOBAL, or 0 (both).
///
/// @return NULL on success, error message on error.
extern char* set_option_value(const char* const name,
                              const long number,
                              const char* const string,
                              const int opt_flags);

/// Set or remove a mapping or an abbreviation in the current buffer, OR
/// display (matching) mappings/abbreviations.
///
/// ```vim
/// map[!]                          " show all key mappings
/// map[!] {lhs}                    " show key mapping for {lhs}
/// map[!] {lhs} {rhs}              " set key mapping for {lhs} to {rhs}
/// noremap[!] {lhs} {rhs}          " same, but no remapping for {rhs}
/// unmap[!] {lhs}                  " remove key mapping for {lhs}
/// abbr                            " show all abbreviations
/// abbr {lhs}                      " show abbreviations for {lhs}
/// abbr {lhs} {rhs}                " set abbreviation for {lhs} to {rhs}
/// noreabbr {lhs} {rhs}            " same, but no remapping for {rhs}
/// unabbr {lhs}                    " remove abbreviation for {lhs}
///
/// for :map   mode is NORMAL + VISUAL + SELECTMODE + OP_PENDING
/// for :map!  mode is INSERT + CMDLINE
/// for :cmap  mode is CMDLINE
/// for :imap  mode is INSERT
/// for :lmap  mode is LANGMAP
/// for :nmap  mode is NORMAL
/// for :vmap  mode is VISUAL + SELECTMODE
/// for :xmap  mode is VISUAL
/// for :smap  mode is SELECTMODE
/// for :omap  mode is OP_PENDING
/// for :tmap  mode is TERM_FOCUS
///
/// for :abbr  mode is INSERT + CMDLINE
/// for :iabbr mode is INSERT
/// for :cabbr mode is CMDLINE
/// ```
///
/// @param maptype  0 for |:map|, 1 for |:unmap|, 2 for |noremap|.
/// @param arg      C-string containing the arguments of the map/abbrev
///                 command, i.e. everything except the initial `:[X][nore]map`.
///                 - Cannot be a read-only string; it will be modified.
/// @param mode   Bitflags representing the mode in which to set the mapping.
///               See @ref get_map_mode.
/// @param is_abbrev  True if setting an abbreviation, false otherwise.
///
/// @return 0 on success. On failure, will return one of the following:
///         - 1 for invalid arguments
///         - 2 for no match
///         - 4 for out of mem (deprecated, WON'T HAPPEN)
///         - 5 for entry not unique
///
extern int do_map(int maptype, char_u* arg, int mode, bool is_abbrev);

/// Handle ":highlight" command
///
/// When using ":highlight clear" this is called recursively for each group with
/// forceit and init being both true.
///
/// @param[in]  line  Command arguments.
/// @param[in]  forceit  True when bang is given, allows to link group even if
///                      it has its own settings.
/// @param[in]  init  True when initializing.
extern void do_highlight(const char *line, const bool forceit, const bool init);

/// ":augroup {name}".
extern void do_augroup(char_u *arg, int del_group);

typedef enum auto_event {
  EVENT_BUFADD = 0,
  EVENT_BUFDELETE = 1,
  EVENT_BUFENTER = 2,
  EVENT_BUFFILEPOST = 3,
  EVENT_BUFFILEPRE = 4,
  EVENT_BUFHIDDEN = 5,
  EVENT_BUFLEAVE = 6,
  EVENT_BUFMODIFIEDSET = 7,
  EVENT_BUFNEW = 8,
  EVENT_BUFNEWFILE = 9,
  EVENT_BUFREADCMD = 10,
  EVENT_BUFREADPOST = 11,
  EVENT_BUFREADPRE = 12,
  EVENT_BUFUNLOAD = 13,
  EVENT_BUFWINENTER = 14,
  EVENT_BUFWINLEAVE = 15,
  EVENT_BUFWIPEOUT = 16,
  EVENT_BUFWRITECMD = 17,
  EVENT_BUFWRITEPOST = 18,
  EVENT_BUFWRITEPRE = 19,
  EVENT_CHANINFO = 20,
  EVENT_CHANOPEN = 21,
  EVENT_CMDUNDEFINED = 22,
  EVENT_CMDWINENTER = 23,
  EVENT_CMDWINLEAVE = 24,
  EVENT_CMDLINECHANGED = 25,
  EVENT_CMDLINEENTER = 26,
  EVENT_CMDLINELEAVE = 27,
  EVENT_COLORSCHEME = 28,
  EVENT_COLORSCHEMEPRE = 29,
  EVENT_COMPLETECHANGED = 30,
  EVENT_COMPLETEDONE = 31,
  EVENT_COMPLETEDONEPRE = 32,
  EVENT_CURSORHOLD = 33,
  EVENT_CURSORHOLDI = 34,
  EVENT_CURSORMOVED = 35,
  EVENT_CURSORMOVEDI = 36,
  EVENT_DIFFUPDATED = 37,
  EVENT_DIRCHANGED = 38,
  EVENT_ENCODINGCHANGED = 39,
  EVENT_EXITPRE = 40,
  EVENT_FILEAPPENDCMD = 41,
  EVENT_FILEAPPENDPOST = 42,
  EVENT_FILEAPPENDPRE = 43,
  EVENT_FILECHANGEDRO = 44,
  EVENT_FILECHANGEDSHELL = 45,
  EVENT_FILECHANGEDSHELLPOST = 46,
  EVENT_FILEREADCMD = 47,
  EVENT_FILEREADPOST = 48,
  EVENT_FILEREADPRE = 49,
  EVENT_FILETYPE = 50,
  EVENT_FILEWRITECMD = 51,
  EVENT_FILEWRITEPOST = 52,
  EVENT_FILEWRITEPRE = 53,
  EVENT_FILTERREADPOST = 54,
  EVENT_FILTERREADPRE = 55,
  EVENT_FILTERWRITEPOST = 56,
  EVENT_FILTERWRITEPRE = 57,
  EVENT_FOCUSGAINED = 58,
  EVENT_FOCUSLOST = 59,
  EVENT_FUNCUNDEFINED = 60,
  EVENT_GUIENTER = 61,
  EVENT_GUIFAILED = 62,
  EVENT_INSERTCHANGE = 63,
  EVENT_INSERTCHARPRE = 64,
  EVENT_INSERTENTER = 65,
  EVENT_INSERTLEAVE = 66,
  EVENT_INSERTLEAVEPRE = 67,
  EVENT_MENUPOPUP = 68,
  EVENT_OPTIONSET = 69,
  EVENT_QUICKFIXCMDPOST = 70,
  EVENT_QUICKFIXCMDPRE = 71,
  EVENT_QUITPRE = 72,
  EVENT_REMOTEREPLY = 73,
  EVENT_SESSIONLOADPOST = 74,
  EVENT_SHELLCMDPOST = 75,
  EVENT_SHELLFILTERPOST = 76,
  EVENT_SIGNAL = 77,
  EVENT_SOURCECMD = 78,
  EVENT_SOURCEPOST = 79,
  EVENT_SOURCEPRE = 80,
  EVENT_SPELLFILEMISSING = 81,
  EVENT_STDINREADPOST = 82,
  EVENT_STDINREADPRE = 83,
  EVENT_SWAPEXISTS = 84,
  EVENT_SYNTAX = 85,
  EVENT_TABCLOSED = 86,
  EVENT_TABENTER = 87,
  EVENT_TABLEAVE = 88,
  EVENT_TABNEW = 89,
  EVENT_TABNEWENTERED = 90,
  EVENT_TERMCHANGED = 91,
  EVENT_TERMCLOSE = 92,
  EVENT_TERMENTER = 93,
  EVENT_TERMLEAVE = 94,
  EVENT_TERMOPEN = 95,
  EVENT_TERMRESPONSE = 96,
  EVENT_TEXTCHANGED = 97,
  EVENT_TEXTCHANGEDI = 98,
  EVENT_TEXTCHANGEDP = 99,
  EVENT_TEXTYANKPOST = 100,
  EVENT_UIENTER = 101,
  EVENT_UILEAVE = 102,
  EVENT_USER = 103,
  EVENT_VIMENTER = 104,
  EVENT_VIMLEAVE = 105,
  EVENT_VIMLEAVEPRE = 106,
  EVENT_VIMRESIZED = 107,
  EVENT_VIMRESUME = 108,
  EVENT_VIMSUSPEND = 109,
  EVENT_WINCLOSED = 110,
  EVENT_WINENTER = 111,
  EVENT_WINLEAVE = 112,
  EVENT_WINNEW = 113,
  EVENT_WINSCROLLED = 114,
  NUM_EVENTS = 115,
} event_T;

extern int do_autocmd_event(event_T event, char_u *pat, bool once, int nested, char_u *cmd, int forceit, int group);

#endif  // NVIM_H
