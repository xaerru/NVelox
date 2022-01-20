#include <dirent.h>
#include <stdlib.h>
#include "message.h"

void load_c_plugins(const char* dir) {
   struct dirent **namelist;
   int n = scandir(dir, &namelist, NULL, NULL);
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
   load_c_plugins(getenv("NVELOX_PLUGIN_DIR"));
   nv_out_msg("nvelox is loaded");
}
