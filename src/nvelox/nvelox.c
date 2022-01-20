#include <dirent.h>
#include <stdlib.h>
#include <stdio.h>
#include <regex.h>
#include <string.h>
#include "message.h"

static int parse_ext(const struct dirent *dir)
   {
     if(!dir)
       return 0;
     if(dir->d_type == DT_REG || dir->d_type == DT_LNK) {
         regex_t regex;
         regcomp(&regex, "^.*\\.so((\\.)([0-9+]))?$", REG_EXTENDED);
         int ext = regexec(&regex, dir->d_name, 0, NULL, 0);
         regfree(&regex);
         if(!ext)
           return 1;
         else 
           return 0;    
     }
     return 0;
}

static void get_realpath(const char *filename, const char *dir, char* buf) {
    snprintf(buf, strlen(dir)+strlen(filename)+2, "%s/%s", dir, filename);
    realpath(buf, buf);
}

void load_c_plugins(const char* dir) {
   struct dirent **namelist;
   int n = scandir(dir, &namelist, parse_ext, NULL);
   if (n < 0) nv_err_msg("nvelox: Couldn't scan plugin directory.");
   else {
      while(n--) {
         char plugin_path[PATH_MAX+1];
	 get_realpath(namelist[n]->d_name, dir, plugin_path);
         nv_out_msg(plugin_path);
	 free(namelist[n]);
      }
      free(namelist);
   }
}

void start_point(){
   const char* plugin_dir = getenv("NVELOX_PLUGIN_DIR");
   if(!plugin_dir) load_c_plugins("/some/path");
   else load_c_plugins(getenv("NVELOX_PLUGIN_DIR"));
   nv_out_msg("nvelox is loaded");
}
