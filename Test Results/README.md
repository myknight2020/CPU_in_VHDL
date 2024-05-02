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

-- LW R2, R0(0) ; loading 7 into R2 (0x8c020000)

notice R2 is the address being written (waddr) to and the data it is getting (douta) is 7 after the 2 clock cycles it takes to read from RAM

-- LW R3, R0(1) ; storing 2 into R3 (0x8c030001)

notice R3 is the address being written (waddr) to and the data it is getting (douta) is 2 after the 2 clock cycles it takes to read from RAM

-- OR R4, R2, R3 ; 7 or 2 => 7 (R4) (0x00432025)

notice R2 and R3 are being read from (raddr1 and raddr2) and their data is sent to the ALU (port1 and port2). R4 is being written to (waddr). 2 and 7 undergo a logical OR, meaning the result, 7, is stored into R4 (wdata)

-- ADD R5, R4, R2 ; 7 + 7 = e (R5) (0x00822820)

notice R2 and R4 are being read from (raddr1 and raddr2) and their data is sent to the ALU (port1 and port2). R5 is being written to (waddr). 7 and 7 undergo addition, meaning the result, e, is stored into R5 (wdata)

-- SW R5, R0(2) ; storing R5 into memory location 2 (0xac050002)

notice R5 denotes the data to store into memory (raddr2). The memory location is denoted by ExtImm, which is 2, added to the data from raddr1, which is 0, resulting in memory location 2. the data being stored into RAM in memory location to is shown by dina, which is e from R5.


-- LW R7, R0(2) ; reloading the changed data from memory location 2  (0x8c070002)

notice R7 is the address being written (waddr) to and the data it is getting (douta) is e after the 2 clock cycles it takes to read from RAM

-- LW R6, R0(3) ; loading 14 into R6 (0x8c060003)

notice R6 is the address being written (waddr) to and the data it is getting (douta) is e after the 2 clock cycles it takes to read from RAM

-- BEQ R6, R7, hop(instruction 10) ; checking if R6 and R7 are equal (yes) and jumping to instruction 10/A; (0x10c70003)

Notice that the data from R6 and R7 are checked for equality (port1 and port2). Because they are, we jump to the designated next instruction, which is a. This can be seen in PC_out.

-- jump loop(instruction 0) ; jumps to instruction 0, restarting the program (0x08000000)

notice the next instruction brings us back to the beginning of the program
