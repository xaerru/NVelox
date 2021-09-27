#ifndef NVIM_H
#define NVIM_H

#include <stdbool.h>

// Shorthand for unsigned variables. Many systems, but not all, have u_char
// already defined, so we use char_u to avoid trouble.
typedef unsigned char char_u;

/// Set a string option to a new value, handling the effects
///
/// @param[in]  opt_idx  Option to set.
/// @param[in]  value  New value.
/// @param[in]  opt_flags  Option flags: expected to contain #OPT_LOCAL and/or
///                        #OPT_GLOBAL.
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
extern int do_map(int maptype, char_u *arg, int mode, bool is_abbrev);

#endif  // NVIM_H
