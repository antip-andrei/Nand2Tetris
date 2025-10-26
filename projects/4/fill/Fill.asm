// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

(READ)
	// read KBD
	@KBD
	D=M
	// if (KBD != 0) color = 0
	// else color = -1
	@color
	M=0
	@FILL
	D;JEQ
	@color
	M=-1
(FILL)
	// i = 0
	@i
	M=0
(LOOP)
	// if (i == 8192) goto READ
	@i
	D=M
	@8192
	D=D-A
	@READ
	D;JEQ
	// address = SCREEN + i
	@i
	D=M
	@SCREEN
	D=D+A
	@address
	M=D
	// *address = color
	@color
	D=M
	@address
	A=M
	M=D
	// i += 1
	@i
	M=M+1
	// goto LOOP
	@LOOP
	0;JMP