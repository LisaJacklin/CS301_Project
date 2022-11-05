--Figure 1B code

library IEEE;
use IEEE.std_logic_1164.all;

ENTITY Fig1B IS
	PORT ( M1, M2, Q0, Q1, Cin :In STD_LOGIC;
			 Cout, S :OUT STD_LOGIC);
END ENTITY;

ARCHITECTURE Block1 OF Fig1B IS
	
	--this includes the adder, so it may be used in this circuit.
	COMPONENT Adder IS 
		PORT (X1, X2, Cin : IN STD_Logic ; --x and y are inputs of the adder
				Cout, S :BUFFER STD_Logic); --c is the carry and s is the sum value
				
	END COMPONENT;

	SIGNAL A1, A2, A3 :STD_LOGIC;
	
	BEGIN
	 
	 A1 <= M1 AND Q0;
	 A2 <= M2 AND Q1;
	 
	 --issues here with port mappin...

	 A4:Adder PORT MAP (X1 => A1, X2 => A2, Cin => Cin, --INPUTS
		Cout => Cout, S => s); --OUTPUT VALUES FROM ADDER
	 

	END ARCHITECTURE;
