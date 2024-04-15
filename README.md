# CPU_in_VHDL
I created a very simple MIPS-based CPU in VHDL. I used Vivado to compile and test the design.

The design tries to implement the schematic described in Computer Organization and Design, The Hardware/Software Interface by David A. Patterson and John L. Hennessy.

It is supposed to run 9 MIPS instructions:
-- LW R2, R0(0) ; storing 7 into R2                                
-- LW R3, R0(1) ; storing 2 into R3                                
-- OR R4, R2, R3 ; 7 or 2 => 7 (R4)                                
-- ADD R5, R4, R2 ; 7 + 7 = e (R5)                                 
-- SW R0(2), R5 ; storing R5 into memory location 2                
-- LW R7, R0(2) ; reloading the changed data from memory location 2
-- LW R6, R0(3) ; loading 14 into R6                                                                               
-- BEQ R6, R7, hop(instruction 10) ; checking if R6 and R7 are equal (yes) and jumping to instruction 10/A;
-- jump loop(instruction 0) ; jumps to instruction 0, restarting the program

It's not perfect, there are a lot of issues:
-does not support every MIPS instruction
-only supports 16 total assembly instructions because of the ROM design
-unused files
-and more
