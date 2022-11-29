;CS 301
;Lisa Jacklin 
;11/21/2022
;Project: assembly 4by4 bit multiplier!

;Goal: create a chunk of assembly code that will take two four bit values, and multiply them together giving a binary output!
;this is achieved through the use and reference of VHDL code that can be seen in my CS301_project github repository.

;Note that having the subcircuit and multiplier circuit pictures present in my github repository will be helpful in understanding the code 
;and comments below.
 

;Now, to begin the full multiplier circuit....using the subcircuits... 
ret


section .data ;note the last value is the least significant!
 M: 
 	dq 0,0,0,0
 Q: 
 	dq 0,0,0,0
 
 
;now, check to see how I have to implement these sections...
;adjust the subcircuits to make sure it works with the FULL MULTIPLIER
Section .data ;this is modifiable values, which should work well for my intermediates!
PP1:
	dq 0,0,0,0
PP2:
	dq 0,0,0,0
Cout:
	dq 0,0,0,0,0,0,0,0
Product:
	dq 0,0,0,0,0,0,0
EndCarry:
	dq 0

;ADJUSTMENTS: allowing the input values be changeable to some degree...
; mostly pertaining to fig1b and fig1c or top and secondrows
section .text ; this should be executable machine code.
Adder:
	;the values for r8 and r9 are given by the the other subcircuits values
	;so fig1b or fig1c values...
	cmp r8, 0
		jg Sum
	cmp r9, 0
		jg Sum
	
	Sum:
		cmp r8, r9
			je Equal
			jg SumNoCout
			jl SumNoCout
			
	SumNoCout:
		mov r10, 1 ; sum value is one
		mov r11, 0
	
	Equal:
		mov r11, 1 ; this is the carry value, 
		mov r10, 0 ; and this is the corresponding sum value
	
	ret
		
TopRow:;fig1b top row values
 	;first two values
 	;ADD IN CARRY LATER
 	mov rax, M ;set to M array adress
 	mov rdi, Q ; set to Q array
 	
	mov r8, QWORD[rcx]
	mov r9, QWORD[rcx+16]
	;second two values
	mov r10, QWORD[rdi+24]
	mov r11, QWORD[rdi+16]
 
	 cmp r8, r11
	 	je Adder
	 cmp r9, r10
	 	je Adder
	;the values for r8 and r9 are given by the the other subcircuits values
	;so fig1b or fig1c values...
	;CHECK THAT THERE ISNOT SOMETHING ELSE I NEED TO DO...
	;HAVE A GUT FEELING IM MISSING SOMETHING

	ret
	;Return 4219120 (0x4060F0)
	;this this could be an overload value...

SecondRow: ;fig1c, used in the second and last row that gives the output values...
 	;ADD CARRY VALUES LATER
 	
 	mov rax, M
 	mov rdi, Q
 	mov rcx, Cout ;this is where the carry values come in...so Cout, PP1, and PP2
 	
 	mov r8, QWORD[rax]
 	mov r9, QWORD[rdi]
 
 	cmp r8,r9
 		je A1
 		
 	cmp r8, rcx ;x1 = M and x2 = cout vallue...or the cc of fig1c
 		jmp Adder
 	;ADJUST THIS CIRCUIT...
 		
 	A1: ;I do not want this to be the same as Equal: but atm that is what i'm working with
 		mov r11, 1; carry value...
 		mov r10, 0; sum value...
 		
	ret
