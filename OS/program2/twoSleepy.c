/*
Created by Caleb T. Kyle 9/11/16 
Compiled on genuse31 using -o and -std=c99 and -w. The program name is "twoSleepy" and run with ./twoSleepy
	gcc -o twoSleepy -std=c99 twoSleepy.c -w

When I comment out sleep the ordering of the messages gets all messed up. Instead of alternating between the
two (between the parent and child code) it runs all of the parent processes and then runs all of the child processes.
This is the case because if there is no sleep function, it is more efficient to just finish all of the parent program all
at once and then run all the child program. However, if the sleep function is added in, it's more efficient to switch between
the two processes. When the first process goes to sleep, the OS recognizes that the processor is not being utilized, so it 
blocks the first process and puts the child process on the processor which runs until it starts to sleep. At that point the OS
puts the child process in a blocked state and puts the parent process back on the processor (when it is done sleeping).

In this way the OS achieves a maximization of system resource utilization, which is ultimately the main job of the OS. 

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

pid_t knifeSpoonFork =  fork();
for(int i = 0; i < count; i++){
 sleep(1);
 if(knifeSpoonFork > 0){
 	printf("%s%d%s%d%s%d\n", "Original Process with PID: ", (int)getpid(), " and PPID: ", (int)getppid(), " tick ", i + 1);
 }
 else if(knifeSpoonFork == 0){
 	printf("%s%d%s%d%s%d\n", "Child Process with PID: ", (int)getpid(), " and PPID: ", (int)getppid(), " tick ", i + 1);
 }
}

return 0;
}
