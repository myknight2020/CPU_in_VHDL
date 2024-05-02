Signals

PC_out: output of the program counter; denotes which instruction to read from ROM
ROM_out: output of ROM ; output MIPS instruciton in hex
wdata: data to be fed into a register
waddr: specifying which register into which to write wdata
raddr1 and raddr2: specifying which registers to read from
rdata1 and rdata2: read data from registers
port1 and port2: ALU inputs
ALUout_sig: ALU output
douta: data read from RAM
dina: data stored into RAM
addra: address to read/write from/to RAM

Explanation

PC_out and ROM_out denote which instruction is currently being executed. Each instruction was made to last for 3 clock cycles because accessing the register file and RAM takes 1 and 2 clock cycles, respectively. So, every instruciton is about 60ns in this example. R0 is hard-coded to always be 0.

-- LW R3, R0(1) ; storing 2 into R3 (0x8c020000)
relevant signals: 


-- OR R4, R2, R3 ; 7 or 2 => 7 (R4) (0x8c030001)


-- ADD R5, R4, R2 ; 7 + 7 = e (R5) (0x00432025)
-

-- SW R5, R0(2) ; storing R5 into memory location 2 (0x00822820)


-- LW R7, R0(2) ; reloading the changed data from memory location 2 -- LW R6, R0(3) ; loading 14 into R6 (0xac050002)


-- BEQ R6, R7, hop(instruction 10) ; checking if R6 and R7 are equal (yes) and jumping to instruction 10/A; (0x

-- jump loop(instruction 0) ; jumps to instruction 0, restarting the program (0x

