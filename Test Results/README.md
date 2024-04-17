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

PC_out and ROM_out denote which instruction is currently being executed. Each instruction was made to last for 3 clock cycles because executing reading from the register file and accessing RAM takes 1 and 2 clock cycles, respectively.

The first instruction is 
