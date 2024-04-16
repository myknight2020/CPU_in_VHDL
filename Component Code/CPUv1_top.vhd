----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2024 08:24:24 PM
-- Design Name: 
-- Module Name: CPUv1_top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CPUv1_top is
  Port ( 
        clk, rst : in std_logic
        --PC_in : in std_logic_vector(3 downto 0)
        
        );
end CPUv1_top;

architecture Behavioral of CPUv1_top is

component RegisterFile is 
    Port (
        clk,rst,wen : in std_logic;
        wdata : in std_logic_vector(31 downto 0);
        waddr, raddr1, raddr2 : in std_logic_vector(4 downto 0);
        rdata1, rdata2 : out std_logic_vector(31 downto 0)
    
    );
end component;

component ROM is
port(
        address : in  std_logic_vector(3 downto 0);
        dout    : out std_logic_vector(31 downto 0)
    );
end component;

--component mem_sys is -- RAM
--    Port ( 
--        mem_addr : in std_logic_vector(8 downto 0);
--        ram_din : in std_logic_vector(31 downto 0);
--        clk,rst, en : in std_logic;
--        we : in std_logic_vector(0 downto 0);
--        mem_out : out std_logic_vector(31 downto 0)
      
--      ); 

--end component;

component gen_RAM IS --RAM
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END component gen_RAM;

component ALU is
    Port ( 
          port1, port2: in std_logic_vector(31 downto 0);
          ALUcontrol: in std_logic_vector(5 downto 0);
          ALUOp : in std_logic_vector(1 downto 0);
          N_flag: out std_logic; --negative flag
          Z_flag: out std_logic; --zero flag
          C_flag: out std_logic; --carry flag
          V_flag: out std_logic; --overflow flag
          ALUout: out std_logic_vector(31 downto 0)
      );

end component;

component control_block is
    Port ( 
        instruction_input : in std_logic_vector(5 downto 0);
        clk : in std_logic;
        RegDst, Branch, MemRead, MemtoReg, MemWrite,ALUsrc,RegWrite, Jump : out std_logic;
        ALUOp : out std_logic_vector(1 downto 0)
    );

end component;

component program_counter is
    Port (
        clk : in std_logic; 
        PC_in : in std_logic_vector(4 downto 0);
        PC_out : out std_logic_vector(4 downto 0)
        );


end component;

--Program Counter wires

signal PC_out : std_logic_vector(4 downto 0); -- from PC to ROM
signal PC_new_instruction, PC_jump_instruction : std_logic_vector(4 downto 0);
signal branch_control, jump_control : std_logic;
signal PC_in : std_logic_vector(4 downto 0); --from MUX to PC

--ROM wires

signal ROM_out : std_logic_vector(31 downto 0); -- from ROM to Control, Register File, and sign extend

--Control Block wires

signal RegDst_sig, Branch_sig, MemRead_sig, MemtoReg_sig, ALUsrc_sig, RegWrite_sig : std_logic;
signal ALUOp_sig : std_logic_vector(1 downto 0);
signal MemWrite_sig : std_logic_vector(0 downto 0);

--Register File wires

signal ReadData1, ReadData2 : std_logic_vector(31 downto 0);
signal WriteRegister : std_logic_vector(4 downto 0);
signal ReturnedResult : std_logic_vector(31 downto 0);

--ALU wires

signal ALUport2 : std_logic_vector(31 downto 0);
signal ExtImm : std_logic_vector(31 downto 0);
signal ALUout_sig : std_logic_vector(31 downto 0);
signal zero_sig : std_logic;

--RAM wires

signal RAMReadData : std_logic_vector(31 downto 0);




begin

    PC : program_counter port map(
        clk => clk,
        PC_in => PC_in,
        PC_out => PC_out
        );

    instruction_rom : ROM port map(address => PC_out(3 downto 0), dout => ROM_out);
    
    control: control_block port map(instruction_input => ROM_out(31 downto 26), 
                                    RegDst => RegDst_sig, 
                                    Branch => Branch_sig, 
                                    MemRead => MemRead_sig, 
                                    MemtoReg => MemtoReg_sig,
                                    MemWrite => MemWrite_sig(0), 
                                    ALUsrc => ALUsrc_sig, 
                                    RegWrite => RegWrite_sig,
                                    ALUOp => ALUOp_sig,
                                    Jump => jump_control,
                                    clk => clk);

    rfile: RegisterFile port map(clk => clk,
                                 rst => rst,
                                 wen => RegWrite_sig,
                                 wdata => ReturnedResult,
                                 waddr => WriteRegister, 
                                 raddr1 => ROM_out(25 downto 21),
                                 raddr2 => ROM_out(20 downto 16),
                                 rdata1 => ReadData1, 
                                 rdata2 => ReadData2);
    WriteRegister <= ROM_out(15 downto 11) when RegDst_sig = '1' else 
                     ROM_out(20 downto 16);
                     
    ReturnedResult <= RAMReadData when MemtoReg_sig = '1' else
                      ALUout_sig;
                                           
    main_alu: ALU port map(port1 => ReadData1, 
                           port2 => ALUport2,
                           ALUOp => ALUOp_sig,
                           ALUcontrol => ROM_out(5 downto 0),
                           N_flag => open,
                           Z_flag => zero_sig,
                           C_flag => open,
                           V_flag => open,
                           ALUout => ALUout_sig);
    
    ExtImm <= ROM_out(15) & ROM_out(15) & ROM_out(15) & ROM_out(15) & ROM_out(15) & ROM_out(15) & ROM_out(15) & ROM_out(15) & ROM_out(15) & ROM_out(15) & ROM_out(15) & ROM_out(15) & ROM_out(15) & ROM_out(15) & ROM_out(15) & ROM_out(15) & ROM_out(15 downto 0);                       
    ALUport2 <= ExtImm when ALUsrc_sig = '1' else ReadData2;
    
       
    ram: gen_RAM port map(addra => ALUout_sig(8 downto 0),
                          dina => ReadData2,
                          clka => clk,
                          ena => MemRead_sig,
                          wea => MemWrite_sig,
                          douta => RAMReadData);
                          
                          
     -- branch instruction components
     
     PC_new_instruction <= std_logic_vector(signed(PC_out) + 1);
     
     PC_jump_instruction <= ExtIMM(4 downto 0) when jump_control = '1' else std_logic_vector(signed(PC_new_instruction) + signed(ExtImm(4 downto 0)) - 1);
     
     branch_control <= branch_sig and zero_sig;
     
     PC_in <= PC_jump_instruction when branch_control = '1' else PC_new_instruction;
     
     -- jump instruction components
     
     
     
    
end Behavioral;
