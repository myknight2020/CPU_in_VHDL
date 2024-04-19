----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/08/2024 07:57:28 PM
-- Design Name: 
-- Module Name: reg - Behavioral
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


entity reg is
  Port ( 
    clk, rst, load : in std_logic;
    datain : in std_logic_vector(31 downto 0);
    dataout : out std_logic_vector(31 downto 0)
  );
end reg;

architecture Behavioral of reg is


begin

    process(clk)
    begin
        
        if rising_edge(clk) then
            if rst = '1' then
                dataout <= (others => '0');        
            elsif load = '1' then
                dataout <= datain;
            end if;       
        end if;
        
    end process;


end Behavioral;
