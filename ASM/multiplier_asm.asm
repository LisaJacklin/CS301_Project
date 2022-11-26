 ;11/21/2022
 ;asm bit multiplier
 
ret

;THIS HAS TO BE .DATA! 
section .data ;note the last value is the least significant!
 M: 
 	dq 0,0,0,0
 Q: 
 	dq 0,0,0,0
 
 
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
 	mov rax, M ;set to M array adress
 	mov rdi, Q ; set to Q array
 	
	mov r8, QWORD[rcx]
	mov r9, QWORD[rcx+16]
	;second two values
	mov r10, QWORD[rdi+24]
	mov r11, QWORD[rdi+16]
 
	 cmp r8, r11
	 ;	je Adder
	 cmp r9, r10
	 ;	je Adder
	;the values for r8 and r9 are given by the the other subcircuits values
	;so fig1b or fig1c values...

	ret
	;Return 4219120 (0x4060F0)
	;this this could be an overload value...

SecondRow:
