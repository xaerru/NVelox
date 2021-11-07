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

