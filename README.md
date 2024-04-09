# CPU_in_VHDL
I created a very simple MIPS-based CPU in VHDL. I used Vivado to compile and test the design.

It is supposed to run 6 MIPS instructions:
-- LW R2, R0(0) ; storing 7 into R2                                
-- LW R3, R0(1) ; storing 2 into R3                                
-- OR R4, R2, R3 ; 7 or 2 => 7 (R4)                                
-- ADD R5, R4, R2 ; 7 + 7 = e (R5)                                 
-- SW R0(2), R5 ; storing R5 into memory location 2                
-- LW R7, R0(2) ; reloading the changed data from memory location 2
