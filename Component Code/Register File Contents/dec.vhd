----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/08/2024 09:12:53 PM
-- Design Name: 
-- Module Name: dec - Behavioral
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


entity dec is
  Port ( 
    waddr : in std_logic_vector(4 downto 0);
    we, rst : in std_logic;
    dec_out : out std_logic_vector(31 downto 0)
    
  );
end dec;

architecture Behavioral of dec is

signal dec_out_sig : std_logic_vector(31 downto 0);

begin

dec_out <= (others => '0') when rst = '1' else dec_out_sig when we = '1' else (others => '0');
           
with waddr select
    dec_out_sig <= X"00000001" when "00000",
                   X"00000002" when "00001",
                   X"00000004" when "00010",
                   X"00000008" when "00011",
                   X"00000010" when "00100",
                   X"00000020" when "00101",
                   X"00000040" when "00110",
                   X"00000080" when "00111",
                   X"00000100" when "01000",
                   X"00000200" when "01001",
                   X"00000400" when "01010",
                   X"00000800" when "01011",
                   X"00001000" when "01100",
                   X"00002000" when "01101",
                   X"00004000" when "01110",
                   X"00008000" when "01111",
                   X"00010000" when "10000",
                   X"00020000" when "10001",
                   X"00040000" when "10010",
                   X"00080000" when "10011",
                   X"00100000" when "10100",
                   X"00200000" when "10101",
                   X"00400000" when "10110",
                   X"00800000" when "10111",
                   X"01000000" when "11000",
                   X"02000000" when "11001",
                   X"04000000" when "11010",
                   X"08000000" when "11011",
                   X"10000000" when "11100",
                   X"20000000" when "11101",
                   X"40000000" when "11110",
                   X"80000000" when "11111",
                   X"00000000" when others;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        
--process(waddr)
--begin
--      if rst = '1' then
--         dec_out <= X"00000000";
--      elsif we = '1' then
--         case waddr is
--            when "00000" => dec_out <= X"00000001";
--            when "00001" => dec_out <= X"00000002";
--            when "00010" => dec_out <= X"00000004";
--            when "00011" => dec_out <= X"00000008";
--            when "00100" => dec_out <= X"00000010";
--            when "00101" => dec_out <= X"00000020";
--            when "00110" => dec_out <= X"00000040";
--            when "00111" => dec_out <= X"00000080";
--            when "01000" => dec_out <= X"00000100";
--            when "01001" => dec_out <= X"00000200";
--            when "01010" => dec_out <= X"00000400";
--            when "01011" => dec_out <= X"00000800";
--            when "01100" => dec_out <= X"00001000";
--            when "01101" => dec_out <= X"00002000";
--            when "01110" => dec_out <= X"00004000";
--            when "01111" => dec_out <= X"00008000";
--            when "10000" => dec_out <= X"00010000";
--            when "10001" => dec_out <= X"00020000";
--            when "10010" => dec_out <= X"00040000";
--            when "10011" => dec_out <= X"00080000";
--            when "10100" => dec_out <= X"00100000";
--            when "10101" => dec_out <= X"00200000";
--            when "10110" => dec_out <= X"00400000";
--            when "10111" => dec_out <= X"00800000";
--            when "11000" => dec_out <= X"01000000";
--            when "11001" => dec_out <= X"02000000";
--            when "11010" => dec_out <= X"04000000";
--            when "11011" => dec_out <= X"08000000";
--            when "11100" => dec_out <= X"10000000";
--            when "11101" => dec_out <= X"20000000";
--            when "11110" => dec_out <= X"40000000";
--            when "11111" => dec_out <= X"80000000";
--            when others => dec_out <= X"00000000";
--         end case;        
--      else
--         dec_out <= (others => '0');
--      end if;
--end process;


end Behavioral;
