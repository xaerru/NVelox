#include "message.h"
#include <dirent.h>
#include <dlfcn.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static int
parse_ext (const struct dirent *dir)
{
    if (!dir)
        return 0;
    if (dir->d_type == DT_REG || dir->d_type == DT_LNK) {
        return 1;
    }
    return 0;
}

static void
load_plugins_from_dir (const char *dir)
{
    struct dirent **namelist;
    int n = scandir (dir, &namelist, parse_ext, NULL);
    if (n < 0)
        nv_err_msg ("nvelox: Couldn't scan plugin directory.");
    else {
        while (n--) {
            char path_buf[PATH_MAX + 1];
            char *filename = namelist[n]->d_name;
            free (namelist[n]);
            snprintf (path_buf, strlen (dir) + strlen (filename) + 2, "%s/%s", dir, filename);
            char *realpath_buf = realpath (path_buf, NULL);
            void *handle = dlopen (realpath_buf, RTLD_LAZY);
            void (*func) () = dlsym (handle, "nvelox_plugin_init");
            func ();
        }
        free (namelist);
    }
}

void
nv_load_plugins ()
{
    char *plugin_path = getenv ("NVELOX_PLUGIN_PATH");
    if (!plugin_path)
        load_plugins_from_dir ("/some/path");
    else {
        char *dir;
        while ((dir = strsep (&plugin_path, ":")))
            load_plugins_from_dir (dir);
    }
}
