#include "message.h"
#include <dirent.h>
#include <dlfcn.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "runtime.h"

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
    plugin_count = scandir (dir, &namelist, parse_ext, NULL);
    plugin_handles = malloc(plugin_count*sizeof(void*));
    if (plugin_count < 0)
        nv_err_msg ("nvelox: Couldn't scan plugin directory.");
    else {
        for(int i = plugin_count; --i;) {
            char path_buf[PATH_MAX];
            snprintf (path_buf, sizeof(path_buf), "%s/%s", dir, namelist[i]->d_name);
            free (namelist[i]);
            void *handle = dlopen (realpath(path_buf, NULL), RTLD_LAZY);
            if (!handle) {
              nv_err_msg(dlerror());
              continue;
            }
            plugin_handles[i] = handle;
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
    if (!plugin_path) {
        char path_buf[PATH_MAX];
        char *home = getenv("HOME");
        snprintf(path_buf, sizeof(path_buf), "%s/.local/share/nvelox/plugins/c/lib", home);
        load_plugins_from_dir (path_buf);
    }
    else {
        char *dir;
        while ((dir = strsep (&plugin_path, ":")))
            load_plugins_from_dir (dir);
    }
}
