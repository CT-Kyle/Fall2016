/*
Created by Caleb T. Kyle 9/11/16 
Compiled on genuse31 using -o and -std=c99

It does not always have the same process ID between different instances of the program running but no changes between the iterations of the for loop in the program. This is most likely due to the fact that there are few programs running on the genuse servers which mean that the process ID will not change within the program.

The process transitions to a blocked state (or maybe a suspend state) after a call to the sleep funciton
*/
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
int main(int argc, char *argv[ ]) {
      int count;
      if (argc == 2)
          count = atoi(argv[1]);
      else
          count = 5;

printf("%d%s\n",getpid(),"-START");
for(int i = 0; i < count; i++){
 sleep(1);
// pid_t = getpid(void);
 printf("%d%s%d\n", getpid(), "-TICK ", i+1 );
}

return 0;
}
