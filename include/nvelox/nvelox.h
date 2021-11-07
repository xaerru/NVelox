#ifndef NVELOX_H
#define NVELOX_H

#include <stdbool.h>
#include <stdlib.h>
#include <stdint.h>


void
nv_set_option (const char *name, const char *string, long num, int optflags);

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

#define OPT_BOTH 0
#define OPT_GLOBAL 2
#define OPT_LOCAL 4

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
extern void do_highlight(const char* line, const bool forceit, const bool init);

/// ":augroup {name}".
extern void do_augroup(char_u* arg, int del_group);

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

static const struct event_name {
    size_t len;
    char* name;
    event_T event;
} event_names[] = {
    {6, "BufAdd", EVENT_BUFADD},
    {9, "BufDelete", EVENT_BUFDELETE},
    {8, "BufEnter", EVENT_BUFENTER},
    {11, "BufFilePost", EVENT_BUFFILEPOST},
    {10, "BufFilePre", EVENT_BUFFILEPRE},
    {9, "BufHidden", EVENT_BUFHIDDEN},
    {8, "BufLeave", EVENT_BUFLEAVE},
    {14, "BufModifiedSet", EVENT_BUFMODIFIEDSET},
    {6, "BufNew", EVENT_BUFNEW},
    {10, "BufNewFile", EVENT_BUFNEWFILE},
    {10, "BufReadCmd", EVENT_BUFREADCMD},
    {11, "BufReadPost", EVENT_BUFREADPOST},
    {10, "BufReadPre", EVENT_BUFREADPRE},
    {9, "BufUnload", EVENT_BUFUNLOAD},
    {11, "BufWinEnter", EVENT_BUFWINENTER},
    {11, "BufWinLeave", EVENT_BUFWINLEAVE},
    {10, "BufWipeout", EVENT_BUFWIPEOUT},
    {11, "BufWriteCmd", EVENT_BUFWRITECMD},
    {12, "BufWritePost", EVENT_BUFWRITEPOST},
    {11, "BufWritePre", EVENT_BUFWRITEPRE},
    {8, "ChanInfo", EVENT_CHANINFO},
    {8, "ChanOpen", EVENT_CHANOPEN},
    {12, "CmdUndefined", EVENT_CMDUNDEFINED},
    {11, "CmdWinEnter", EVENT_CMDWINENTER},
    {11, "CmdWinLeave", EVENT_CMDWINLEAVE},
    {14, "CmdlineChanged", EVENT_CMDLINECHANGED},
    {12, "CmdlineEnter", EVENT_CMDLINEENTER},
    {12, "CmdlineLeave", EVENT_CMDLINELEAVE},
    {11, "ColorScheme", EVENT_COLORSCHEME},
    {14, "ColorSchemePre", EVENT_COLORSCHEMEPRE},
    {15, "CompleteChanged", EVENT_COMPLETECHANGED},
    {12, "CompleteDone", EVENT_COMPLETEDONE},
    {15, "CompleteDonePre", EVENT_COMPLETEDONEPRE},
    {10, "CursorHold", EVENT_CURSORHOLD},
    {11, "CursorHoldI", EVENT_CURSORHOLDI},
    {11, "CursorMoved", EVENT_CURSORMOVED},
    {12, "CursorMovedI", EVENT_CURSORMOVEDI},
    {11, "DiffUpdated", EVENT_DIFFUPDATED},
    {10, "DirChanged", EVENT_DIRCHANGED},
    {15, "EncodingChanged", EVENT_ENCODINGCHANGED},
    {7, "ExitPre", EVENT_EXITPRE},
    {13, "FileAppendCmd", EVENT_FILEAPPENDCMD},
    {14, "FileAppendPost", EVENT_FILEAPPENDPOST},
    {13, "FileAppendPre", EVENT_FILEAPPENDPRE},
    {13, "FileChangedRO", EVENT_FILECHANGEDRO},
    {16, "FileChangedShell", EVENT_FILECHANGEDSHELL},
    {20, "FileChangedShellPost", EVENT_FILECHANGEDSHELLPOST},
    {11, "FileReadCmd", EVENT_FILEREADCMD},
    {12, "FileReadPost", EVENT_FILEREADPOST},
    {11, "FileReadPre", EVENT_FILEREADPRE},
    {8, "FileType", EVENT_FILETYPE},
    {12, "FileWriteCmd", EVENT_FILEWRITECMD},
    {13, "FileWritePost", EVENT_FILEWRITEPOST},
    {12, "FileWritePre", EVENT_FILEWRITEPRE},
    {14, "FilterReadPost", EVENT_FILTERREADPOST},
    {13, "FilterReadPre", EVENT_FILTERREADPRE},
    {15, "FilterWritePost", EVENT_FILTERWRITEPOST},
    {14, "FilterWritePre", EVENT_FILTERWRITEPRE},
    {11, "FocusGained", EVENT_FOCUSGAINED},
    {9, "FocusLost", EVENT_FOCUSLOST},
    {13, "FuncUndefined", EVENT_FUNCUNDEFINED},
    {8, "GUIEnter", EVENT_GUIENTER},
    {9, "GUIFailed", EVENT_GUIFAILED},
    {12, "InsertChange", EVENT_INSERTCHANGE},
    {13, "InsertCharPre", EVENT_INSERTCHARPRE},
    {11, "InsertEnter", EVENT_INSERTENTER},
    {11, "InsertLeave", EVENT_INSERTLEAVE},
    {14, "InsertLeavePre", EVENT_INSERTLEAVEPRE},
    {9, "MenuPopup", EVENT_MENUPOPUP},
    {9, "OptionSet", EVENT_OPTIONSET},
    {15, "QuickFixCmdPost", EVENT_QUICKFIXCMDPOST},
    {14, "QuickFixCmdPre", EVENT_QUICKFIXCMDPRE},
    {7, "QuitPre", EVENT_QUITPRE},
    {11, "RemoteReply", EVENT_REMOTEREPLY},
    {15, "SessionLoadPost", EVENT_SESSIONLOADPOST},
    {12, "ShellCmdPost", EVENT_SHELLCMDPOST},
    {15, "ShellFilterPost", EVENT_SHELLFILTERPOST},
    {6, "Signal", EVENT_SIGNAL},
    {9, "SourceCmd", EVENT_SOURCECMD},
    {10, "SourcePost", EVENT_SOURCEPOST},
    {9, "SourcePre", EVENT_SOURCEPRE},
    {16, "SpellFileMissing", EVENT_SPELLFILEMISSING},
    {13, "StdinReadPost", EVENT_STDINREADPOST},
    {12, "StdinReadPre", EVENT_STDINREADPRE},
    {10, "SwapExists", EVENT_SWAPEXISTS},
    {6, "Syntax", EVENT_SYNTAX},
    {9, "TabClosed", EVENT_TABCLOSED},
    {8, "TabEnter", EVENT_TABENTER},
    {8, "TabLeave", EVENT_TABLEAVE},
    {6, "TabNew", EVENT_TABNEW},
    {13, "TabNewEntered", EVENT_TABNEWENTERED},
    {11, "TermChanged", EVENT_TERMCHANGED},
    {9, "TermClose", EVENT_TERMCLOSE},
    {9, "TermEnter", EVENT_TERMENTER},
    {9, "TermLeave", EVENT_TERMLEAVE},
    {8, "TermOpen", EVENT_TERMOPEN},
    {12, "TermResponse", EVENT_TERMRESPONSE},
    {11, "TextChanged", EVENT_TEXTCHANGED},
    {12, "TextChangedI", EVENT_TEXTCHANGEDI},
    {12, "TextChangedP", EVENT_TEXTCHANGEDP},
    {12, "TextYankPost", EVENT_TEXTYANKPOST},
    {7, "UIEnter", EVENT_UIENTER},
    {7, "UILeave", EVENT_UILEAVE},
    {4, "User", EVENT_USER},
    {8, "VimEnter", EVENT_VIMENTER},
    {8, "VimLeave", EVENT_VIMLEAVE},
    {11, "VimLeavePre", EVENT_VIMLEAVEPRE},
    {10, "VimResized", EVENT_VIMRESIZED},
    {9, "VimResume", EVENT_VIMRESUME},
    {10, "VimSuspend", EVENT_VIMSUSPEND},
    {9, "WinClosed", EVENT_WINCLOSED},
    {8, "WinEnter", EVENT_WINENTER},
    {8, "WinLeave", EVENT_WINLEAVE},
    {6, "WinNew", EVENT_WINNEW},
    {11, "WinScrolled", EVENT_WINSCROLLED},
    {8, "BufWrite", EVENT_BUFWRITEPRE},
    {12, "FileEncoding", EVENT_ENCODINGCHANGED},
    {9, "BufCreate", EVENT_BUFADD},
    {7, "BufRead", EVENT_BUFREADPOST},
    {0, NULL, (event_T)0},
};

extern int do_autocmd_event(event_T event,
                            char_u* pat,
                            bool once,
                            int nested,
                            char_u* cmd,
                            int forceit,
                            int group);

// values for cmd_addr_type
typedef enum {
  ADDR_LINES,           // buffer line numbers
  ADDR_WINDOWS,         // window number
  ADDR_ARGUMENTS,       // argument number
  ADDR_LOADED_BUFFERS,  // buffer number of loaded buffer
  ADDR_BUFFERS,         // buffer number
  ADDR_TABS,            // tab page number
  ADDR_TABS_RELATIVE,   // Tab page that only relative
  ADDR_QUICKFIX_VALID,  // quickfix list valid entry number
  ADDR_QUICKFIX,        // quickfix list entry number
  ADDR_UNSIGNED,        // positive count or zero, defaults to 1
  ADDR_OTHER,           // something else, use line number for '$', '%', etc.
  ADDR_NONE             // no range used
} cmd_addr_T;

#define EX_RANGE           0x001  // allow a linespecs
#define EX_BANG            0x002  // allow a ! after the command name
#define EX_EXTRA           0x004  // allow extra args after command name
#define EX_XFILE           0x008  // expand wildcards in extra part
#define EX_NOSPC           0x010  // no spaces allowed in the extra part
#define EX_DFLALL          0x020  // default file range is 1,$
#define EX_WHOLEFOLD       0x040  // extend range to include whole fold also
                                  // when less than two numbers given
#define EX_NEEDARG         0x080  // argument required
#define EX_TRLBAR          0x100  // check for trailing vertical bar
#define EX_REGSTR          0x200  // allow "x for register designation
#define EX_COUNT           0x400  // allow count in argument, after command
#define EX_NOTRLCOM        0x800  // no trailing comment allowed
#define EX_ZEROR          0x1000  // zero line number allowed
#define EX_CTRLV          0x2000  // do not remove CTRL-V from argument
#define EX_CMDARG         0x4000  // allow "+command" argument
#define EX_BUFNAME        0x8000  // accepts buffer name
#define EX_BUFUNL        0x10000  // accepts unlisted buffer too
#define EX_ARGOPT        0x20000  // allow "++opt=val" argument
#define EX_SBOXOK        0x40000  // allowed in the sandbox
#define EX_CMDWIN        0x80000  // allowed in cmdline window; when missing
                                  // disallows editing another buffer when
                                  // current buffer is locked
#define EX_MODIFY       0x100000  // forbidden in non-'modifiable' buffer
#define EX_FLAGS        0x200000  // allow flags after count in argument
#define EX_FILES (EX_XFILE | EX_EXTRA)  // multiple extra files allowed
#define EX_FILE1 (EX_FILES | EX_NOSPC)  // 1 file, defaults to current file
#define EX_WORD1 (EX_EXTRA | EX_NOSPC)  // one extra word allowed

int uc_add_command(char_u *name, size_t name_len, char_u *rep, uint32_t argt, long def,
                          int flags, int compl, char_u *compl_arg, cmd_addr_T addr_type, bool force);

#endif  // NVELOX_H
