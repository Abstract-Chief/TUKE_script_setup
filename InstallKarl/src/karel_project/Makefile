CC=gcc 
CCFLAGS=-g -Wall
LIB= -lsuperkarel -lcurses 

karl%: karl%.c
	$(CC) $(CCFLAGS) $< -o $@ $(LIB)
	./$@
	rm $@
