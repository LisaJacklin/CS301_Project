# CS301_Project

## Goal

My goal for my project, is to create a bit multiplier using x86 assembly, which has been covered in class. In order to perform this, I hope to take some VHDL code that I have from my EE243 (Digital Logic) class which displays the types of logic gates required to multiply two four bit values together, and gradually transform them into a form of assembly that works in the same manner.
 
## Background Information

Since I am working towards a computer engineering degree, and I am also taking digital logic (EE243) which discusses the use of logic gates and functions in setting up a computer chip, I though what a better way to connect two of my classes, than building a circuit I built in VHDL, and turn it into assembly? 

Although VHDL is extremely simplified version of what I will need to create and impliment in assembly, I plan to use bitwise, and hopefully some loops, making my own templates, or some other form to replicate repeated mini circuits that all go into the full build of a 4 by 4 multiplying bit circuit. 

## Additional Ambitions, and Goals

- I hope to display any carry values between rows of calculations, which will hopefully allow for error checking through each sub circuit.
- Timing how long this circuit takes to impliment in asemmbly and compare it to the time required in VHDL
- display the values in decimal and/or hexidecimal as well as in binary values.

## Important Milestones
- 11/7/2022 : building subcircuits (adder, Fig1B, Fig1C) in C++ for later conversion and contemplation in ASM; Adder subcircuit not currently working correctly.
- 11/12/2022 : all subcircuits created and compiling correctly. Multiplier with vector input added.
- 11/13/2022 : multiplier code completed aside from overload errors and testing.
- 11/16/2022 : basic outline for assembly code for the multiplier circuit created and begun (uploaded 11/21/2022)
-11/26/2022 : uploaded asseembly subcircuits without the carry values implemented. Will be added as the full multiplier is coded.

## Final Result

