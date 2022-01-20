#include <dirent.h>
#include <stdlib.h>
#include <stdio.h>
#include <regex.h>
#include "message.h"

static int parse_ext(const struct dirent *dir)
   {
     regex_t regex;
     int reti = regcomp(&regex, "^.*\\.so((\\.)([0-9+]))?$", REG_EXTENDED);
     if(reti) {
        fprintf(stderr, "Could not compile regex\n");
        exit(1);
     };
     if(!dir)
       return 0;

     if(dir->d_type == DT_REG || dir->d_type == DT_LNK) {
         int ext = regexec(&regex, dir->d_name, 0, NULL, 0);
         if(!ext)
           return 1;
         else if (ext == REG_NOMATCH) {
           return 0;
	 } else {
            regerror(ext, &regex, (char*)dir->d_name, sizeof(dir->d_name));
            fprintf(stderr, "Regex match failed: %s\n", dir->d_name);
            exit(1);
	 }
     }
     regfree(&regex);
     return 0;
}

void load_c_plugins(const char* dir) {
   struct dirent **namelist;
   int n = scandir(dir, &namelist, parse_ext, NULL);
   if (n < 0) nv_err_msg("nvelox: Couldn't scan plugin directory.");
   else {
      while(n--) {
         nv_out_msg(namelist[n]->d_name);      
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
