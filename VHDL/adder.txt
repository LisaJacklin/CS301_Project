library IEEE;
use IEEE.std_logic_1164.all;
Entity Adder IS
	Port (X1, X2, Cin : IN STD_Logic ; --x and y are inputs of the adder
			Cout,S :BUFFER STD_Logic); --c is the carry and s is the sum value
			
End Adder;

Architecture Adder_Circuit Of Eight_Bit_Adder is 
		Signal a1, a2, a3, a4, a5: std_logic;
		--signal here?
		
	Begin
		
	a1<=X1 XOR X2;
	a2<=x1 XoR Cin;
	a3<=x1 AND Cin;
	a4<= x2 AND Cin;
	a5<= x1 AND x2;
		
	Cout <= a5 or a3 or a4;
	S <= a1 xor cin;
	
	
		--put logic gate information
End Adder_Circuit;
		