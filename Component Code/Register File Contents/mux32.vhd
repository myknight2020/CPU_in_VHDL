----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/08/2024 08:32:50 PM
-- Design Name: 
-- Module Name: mux32 - Behavioral
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

entity mux32 is
  Port ( 
    radder : in std_logic_vector(4 downto 0);
    dataout : out std_logic_vector(31 downto 0);
  );
end mux32;

architecture Behavioral of mux32 is

begin

process (<selector>,<input1>,<input2>,<input3>,<input4>,
         <input5>,<input6>,<input7>,<input8>)
begin
   case <selector> is
      when "000" => <output> <= <input1>;
      when "001" => <output> <= <input2>;
      when "010" => <output> <= <input3>;
      when "011" => <output> <= <input4>;
      when "100" => <output> <= <input5>;
      when "101" => <output> <= <input6>;
      when "110" => <output> <= <input7>;
      when "111" => <output> <= <input8>;
      when others => <output> <= <input1>;
   end case;
end process;


end Behavioral;
