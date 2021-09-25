#ifndef NVIM_H
#define NVIM_H

/// Set a string option to a new value, handling the effects
///
/// @param[in]  opt_idx  Option to set.
/// @param[in]  value  New value.
/// @param[in]  opt_flags  Option flags: expected to contain #OPT_LOCAL and/or
///                        #OPT_GLOBAL.
///
/// @return NULL on success, error message on error.
char* set_option_value(const char* const name,
                       const long number,
                       const char* const string,
                       const int opt_flags);

#endif  // NVIM_H
