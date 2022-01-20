#include <stdbool.h>

/// Handle ":highlight" command
///
/// When using ":highlight clear" this is called recursively for each group with
/// forceit and init being both true.
///
/// @param[in]  line  Command arguments.
/// @param[in]  forceit  True when bang is given, allows to link group even if
///                      it has its own settings.
/// @param[in]  init  True when initializing.
extern void do_highlight (const char *line, const bool forceit, const bool init);
