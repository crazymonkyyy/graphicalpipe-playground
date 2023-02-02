#include "src/command_info.h"
#include "src/logging.h"

#include <stddef.h>
#include <stdbool.h>

unsigned int command_info_clp_count(
   int const start_argc, int const argc, char * const argv[]) {
   unsigned int cnt = 0;
   for(int i = start_argc; i<argc; ++i) {
      if(argv[i][0]=='[') {
         ++cnt;
      }
   }
   return cnt;
}

/**
 * Placement constructor:
 * pass in a unititialized memory region.
 * Please note that this function modifies the 'argv'.
 */
unsigned int command_info_array_constrcutor(
     command_info_t *icmd, int const start_argc, int const argc, char *argv[]) {
  unsigned int handled_args = 0;
  bool in_cmd = false;
  unsigned int cmd_no = 0;
  for (int i = start_argc; i < argc; ++i) {
    // This is the case when cmd is '[A ...'.
    // Should this be allowed? The problem is that it is not allowed for the
    // closing bracket.
    if (argv[i][0] == '[' && argv[i][1] != '\0') {
      icmd[cmd_no].cmd_name = &argv[i][1];
      icmd[cmd_no].path = argv[i + 1];
      icmd[cmd_no].argv = &argv[i + 1];
      ++cmd_no;
      in_cmd = true;
    }
    // This is the case when cmd is '[ A ...'.
    else if (argv[i][0] == '[' && argv[i][1] == '\0') {
      icmd[cmd_no].cmd_name = argv[i + 1];
      icmd[cmd_no].path = argv[i + 2];
      icmd[cmd_no].argv = &argv[i + 2];
      ++cmd_no;
      in_cmd = true;
    } else if (argv[i][0] == ']') {
      argv[i] = NULL;
      in_cmd = false;
      ++handled_args;
    }

    if(in_cmd) {
      ++handled_args;
    }
  }

  return handled_args;
}

void command_info_array_print(
   command_info_t const * const icmd, unsigned long const cnt) {
   for(unsigned int cidx=0; cidx < cnt; ++cidx) {
      command_info_print(&icmd[cidx]);
   }
}

#if 0
static void command_info_constrcutor(
   command_info_t * self,
   char ** argv) {
   self->path = *argv;
   self->argv = argv;
}
#endif

void command_info_print(command_info_t const * const self) {
  logging(lid_internal, "command", "info", "command_info", 2,
	  "command", self->cmd_name, "path", self->path);
}
