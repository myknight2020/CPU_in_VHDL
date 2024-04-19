----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/08/2024 07:51:50 PM
-- Design Name: 
-- Module Name: RegisterFile - Behavioral
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
use IEEE.NUMERIC_STD.ALL;


entity RegisterFile is
  Port ( 
    clk,rst,wen : in std_logic;
    wdata : in std_logic_vector(31 downto 0);
    waddr, raddr1, raddr2 : in std_logic_vector(4 downto 0);
    rdata1, rdata2 : out std_logic_vector(31 downto 0)
  );
end RegisterFile;

architecture Behavioral of RegisterFile is

component reg is
    Port (
    clk, rst, load : in std_logic;
    datain : in std_logic_vector(31 downto 0);
    dataout : out std_logic_vector(31 downto 0)
    );
end component;

component dec is
    Port ( 
    waddr : in std_logic_vector(4 downto 0);
    we, rst : in std_logic;
    dec_out : out std_logic_vector(31 downto 0)
    
  );

end component;

component mux5_32 is
    Port ( 
    raddr : in std_logic_vector(4 downto 0);
    mt_in0, mt_in1, mt_in2, mt_in3, mt_in4, mt_in5, mt_in6, mt_in7, mt_in8, mt_in9, mt_in10, mt_in11, mt_in12, mt_in13, mt_in14, mt_in15, mt_in16, mt_in17, mt_in18, mt_in19, mt_in20, mt_in21, mt_in22, mt_in23, mt_in24, mt_in25, mt_in26, mt_in27, mt_in28, mt_in29, mt_in30, mt_in31 : in std_logic_vector(31 downto 0);
    data_out : out std_logic_vector(31 downto 0)

  );

end component;

type t_vector is array (31 downto 1) of std_logic_vector(31 downto 0);
signal mt_in : t_vector;


-- signal mt_in0, mt_in1, mt_in2, mt_in3, mt_in4, mt_in5, mt_in6, mt_in7, mt_in8, mt_in9, mt_in10, mt_in11, mt_in12, mt_in13, mt_in14, mt_in15, mt_in16, mt_in17, mt_in18, mt_in19, mt_in20, mt_in21, mt_in22, mt_in23, mt_in24, mt_in25, mt_in26, mt_in27, mt_in28, mt_in29, mt_in30, mt_in31: std_logic_vector(31 downto 0);
signal dec_out: std_logic_vector(31 downto 0);

begin
    
    --reg0 : reg port map(clk => clk, rst => rst, load => dec_out(0), datain => x"00000000", dataout => x"00000000");

    gen: for i in t_vector'range generate
            rega : reg port map(clk => clk, rst => rst, load => dec_out(i), datain => wdata, dataout => mt_in(i));
    end generate gen;
    
    decoder: dec port map(waddr => waddr, we => wen,rst => rst, dec_out => dec_out);
    
    mux1: mux5_32 port map(raddr => raddr1, data_out => rdata1, mt_in0 => x"00000000", mt_in1 => mt_in(1), mt_in2 => mt_in(2), mt_in3 => mt_in(3), mt_in4 => mt_in(4), mt_in5 => mt_in(5), mt_in6 => mt_in(6), mt_in7 => mt_in(7), mt_in8 => mt_in(8), mt_in9 => mt_in(9), mt_in10 => mt_in(10), mt_in11 => mt_in(11), mt_in12 => mt_in(12), mt_in13 => mt_in(13), mt_in14 => mt_in(14), mt_in15 => mt_in(15), mt_in16 => mt_in(16), mt_in17 => mt_in(17), mt_in18 => mt_in(18), mt_in19 => mt_in(19), mt_in20 => mt_in(20), mt_in21 => mt_in(21), mt_in22 => mt_in(22), mt_in23 => mt_in(23), mt_in24 => mt_in(24), mt_in25 => mt_in(25), mt_in26 => mt_in(26), mt_in27 => mt_in(27), mt_in28 => mt_in(28), mt_in29 => mt_in(29), mt_in30 => mt_in(30), mt_in31 => mt_in(31));
    mux2: mux5_32 port map(raddr => raddr2, data_out => rdata2, mt_in0 => x"00000000", mt_in1 => mt_in(1), mt_in2 => mt_in(2), mt_in3 => mt_in(3), mt_in4 => mt_in(4), mt_in5 => mt_in(5), mt_in6 => mt_in(6), mt_in7 => mt_in(7), mt_in8 => mt_in(8), mt_in9 => mt_in(9), mt_in10 => mt_in(10), mt_in11 => mt_in(11), mt_in12 => mt_in(12), mt_in13 => mt_in(13), mt_in14 => mt_in(14), mt_in15 => mt_in(15), mt_in16 => mt_in(16), mt_in17 => mt_in(17), mt_in18 => mt_in(18), mt_in19 => mt_in(19), mt_in20 => mt_in(20), mt_in21 => mt_in(21), mt_in22 => mt_in(22), mt_in23 => mt_in(23), mt_in24 => mt_in(24), mt_in25 => mt_in(25), mt_in26 => mt_in(26), mt_in27 => mt_in(27), mt_in28 => mt_in(28), mt_in29 => mt_in(29), mt_in30 => mt_in(30), mt_in31 => mt_in(31));

    
--    reg0: reg port map(clk => clk, rst => rst, load => dec_out(0), datain => wdata, dataout => mt_in0);
--    reg1: reg port map(clk => clk, rst => rst, load => dec_out(1), datain => wdata, dataout => mt_in1);
--    reg2: reg port map(clk => clk, rst => rst, load => dec_out(2), datain => wdata, dataout => mt_in2);
--    reg3: reg port map(clk => clk, rst => rst, load => dec_out(3), datain => wdata, dataout => mt_in3);
--    reg4: reg port map(clk => clk, rst => rst, load => dec_out(4), datain => wdata, dataout => mt_in4);
--    reg5: reg port map(clk => clk, rst => rst, load => dec_out(5), datain => wdata, dataout => mt_in5);
--    reg6: reg port map(clk => clk, rst => rst, load => dec_out(6), datain => wdata, dataout => mt_in6);
--    reg7: reg port map(clk => clk, rst => rst, load => dec_out(7), datain => wdata, dataout => mt_in7);
--    reg8: reg port map(clk => clk, rst => rst, load => dec_out(8), datain => wdata, dataout => mt_in8);
--    reg9: reg port map(clk => clk, rst => rst, load => dec_out(9), datain => wdata, dataout => mt_in9);
--    reg10: reg port map(clk => clk, rst => rst, load => dec_out(10), datain => wdata, dataout => mt_in10);
--    reg11: reg port map(clk => clk, rst => rst, load => dec_out(11), datain => wdata, dataout => mt_in11);
--    reg12: reg port map(clk => clk, rst => rst, load => dec_out(12), datain => wdata, dataout => mt_in12);
--    reg13: reg port map(clk => clk, rst => rst, load => dec_out(13), datain => wdata, dataout => mt_in13);
--    reg14: reg port map(clk => clk, rst => rst, load => dec_out(14), datain => wdata, dataout => mt_in14);
--    reg15: reg port map(clk => clk, rst => rst, load => dec_out(15), datain => wdata, dataout => mt_in15);
--    reg16: reg port map(clk => clk, rst => rst, load => dec_out(16), datain => wdata, dataout => mt_in16);
--    reg17: reg port map(clk => clk, rst => rst, load => dec_out(17), datain => wdata, dataout => mt_in17);
--    reg18: reg port map(clk => clk, rst => rst, load => dec_out(18), datain => wdata, dataout => mt_in18);
--    reg19: reg port map(clk => clk, rst => rst, load => dec_out(19), datain => wdata, dataout => mt_in19);
--    reg20: reg port map(clk => clk, rst => rst, load => dec_out(20), datain => wdata, dataout => mt_in20);
--    reg21: reg port map(clk => clk, rst => rst, load => dec_out(21), datain => wdata, dataout => mt_in21);
--    reg22: reg port map(clk => clk, rst => rst, load => dec_out(22), datain => wdata, dataout => mt_in22);
--    reg23: reg port map(clk => clk, rst => rst, load => dec_out(23), datain => wdata, dataout => mt_in23);
--    reg24: reg port map(clk => clk, rst => rst, load => dec_out(24), datain => wdata, dataout => mt_in24);
--    reg25: reg port map(clk => clk, rst => rst, load => dec_out(25), datain => wdata, dataout => mt_in25);
--    reg26: reg port map(clk => clk, rst => rst, load => dec_out(26), datain => wdata, dataout => mt_in26);
--    reg27: reg port map(clk => clk, rst => rst, load => dec_out(27), datain => wdata, dataout => mt_in27);
--    reg28: reg port map(clk => clk, rst => rst, load => dec_out(28), datain => wdata, dataout => mt_in28);
--    reg29: reg port map(clk => clk, rst => rst, load => dec_out(29), datain => wdata, dataout => mt_in29);
--    reg30: reg port map(clk => clk, rst => rst, load => dec_out(30), datain => wdata, dataout => mt_in30);
--    reg31: reg port map(clk => clk, rst => rst, load => dec_out(31), datain => wdata, dataout => mt_in31);
    


end Behavioral;
