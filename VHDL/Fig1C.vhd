--Figure 1C code 


library IEEE;
use IEEE.std_logic_1164.all;

ENTITY Fig1C IS
	PORT ( M1, cc, Q1, Cin :In STD_LOGIC;
			 Cout, S :OUT STD_LOGIC);
END ENTITY;

ARCHITECTURE Block2 OF Fig1C IS
	
	--this includes the adder, so it may be used in this circuit.
	COMPONENT Adder IS 
		PORT (X1, X2, Cin : IN STD_Logic ; --x and y are inputs of the adder
				Cout, S :BUFFER STD_Logic); --c is the carry and s is the sum value
				
	END COMPONENT;

	SIGNAL A1 :STD_LOGIC;
	
	BEGIN
	 
	 A1 <= M1 AND Q1;
	

	--DO NOT PORT MAP A SIGNAL
	 A2:Adder PORT MAP (X1 => A1, X2 => cc, Cin => Cin, --inputs
		Cout => Cout, S => s); --outputs
	 

	END ARCHITECTURE;