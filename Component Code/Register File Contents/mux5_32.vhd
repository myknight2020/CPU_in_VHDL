----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/08/2024 09:17:27 PM
-- Design Name: 
-- Module Name: mux5_32 - Behavioral
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


entity mux5_32 is
  Port ( 
    raddr : in std_logic_vector(4 downto 0);
    mt_in0, mt_in1, mt_in2, mt_in3, mt_in4, mt_in5, mt_in6, mt_in7, mt_in8, mt_in9, mt_in10, mt_in11, mt_in12, mt_in13, mt_in14, mt_in15, mt_in16, mt_in17, mt_in18, mt_in19, mt_in20, mt_in21, mt_in22, mt_in23, mt_in24, mt_in25, mt_in26, mt_in27, mt_in28, mt_in29, mt_in30, mt_in31 : in std_logic_vector(31 downto 0);
    data_out : out std_logic_vector(31 downto 0)

  );
end mux5_32;

architecture Behavioral of mux5_32 is

begin

with raddr select
    data_out <= mt_in0 when "00000",
                mt_in1 when "00001",
                mt_in2 when "00010",
                mt_in3 when "00011",
                mt_in4 when "00100",
                mt_in5 when "00101",
                mt_in6 when "00110",
                mt_in7 when "00111",
                mt_in8 when "01000",
                mt_in9 when "01001",
                mt_in10 when "01010",
                mt_in11 when "01011",
                mt_in12 when "01100",
                mt_in13 when "01101",
                mt_in14 when "01110",
                mt_in15 when "01111",
                mt_in16 when "10000",
                mt_in17 when "10001",
                mt_in18 when "10010",
                mt_in19 when "10011",
                mt_in20 when "10100",
                mt_in21 when "10101",
                mt_in22 when "10110",
                mt_in23 when "10111",
                mt_in24 when "11000",
                mt_in25 when "11001",
                mt_in26 when "11010",
                mt_in27 when "11011",
                mt_in28 when "11100",
                mt_in29 when "11101",
                mt_in30 when "11110",
                mt_in31 when "11111",
                (others => '0') when others;

--process(raddr, mt_in0,mt_in1,mt_in2,mt_in3, mt_in4, mt_in5, mt_in6, mt_in7, mt_in8, mt_in9, mt_in10, mt_in11, mt_in12, mt_in13, mt_in14, mt_in15, mt_in16, mt_in17, mt_in18, mt_in19, mt_in20, mt_in21, mt_in22, mt_in23, mt_in24, mt_in25, mt_in26, mt_in27, mt_in28, mt_in29, mt_in30, mt_in31)
--begin
--   case raddr is
--      when "00000" => data_out <= mt_in0;
--      when "00001" => data_out <= mt_in1;
--      when "00010" => data_out <= mt_in2;
--      when "00011" => data_out <= mt_in3;
--      when "00100" => data_out <= mt_in4;
--      when "00101" => data_out <= mt_in5;
--      when "00110" => data_out <= mt_in6;
--      when "00111" => data_out <= mt_in7;
--      when "01000" => data_out <= mt_in8;
--      when "01001" => data_out <= mt_in9;
--      when "01010" => data_out <= mt_in10;
--      when "01011" => data_out <= mt_in11;
--      when "01100" => data_out <= mt_in12;
--      when "01101" => data_out <= mt_in13;
--      when "01110" => data_out <= mt_in14;
--      when "01111" => data_out <= mt_in15;
--      when "10000" => data_out <= mt_in16;
--      when "10001" => data_out <= mt_in17;
--      when "10010" => data_out <= mt_in18;
--      when "10011" => data_out <= mt_in19;
--      when "10100" => data_out <= mt_in20;
--      when "10101" => data_out <= mt_in21;
--      when "10110" => data_out <= mt_in22;
--      when "10111" => data_out <= mt_in23;
--      when "11000" => data_out <= mt_in24;
--      when "11001" => data_out <= mt_in25;
--      when "11010" => data_out <= mt_in26;
--      when "11011" => data_out <= mt_in27;
--      when "11100" => data_out <= mt_in28;
--      when "11101" => data_out <= mt_in29;
--      when "11110" => data_out <= mt_in30;
--      when "11111" => data_out <= mt_in31;
--      when others => data_out <= (others => '0');
--   end case;
--end process;


end Behavioral;
