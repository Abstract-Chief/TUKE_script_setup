CC=gcc 
CCFLAGS=-g -Wall
LIB= -lsuperkarel -lcurses 

task_%: task_%.c
	$(CC) $(CCFLAGS) $< -o $@ $(LIB)
	./$@
	rm $@
