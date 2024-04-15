----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2024 05:55:01 PM
-- Design Name: 
-- Module Name: CPUv1_top_tb - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CPUv1_top_tb is
--  Port ( );
end CPUv1_top_tb;

architecture Behavioral of CPUv1_top_tb is

component CPUv1_top is
    Port(clk, rst : in std_logic
        --PC_in : std_logic_vector(3 downto 0)
        );

end component;

signal clk_sig, rst_sig : std_logic;
--signal PC_in : std_logic_vector(3 downto 0) := "0000";

begin

cpu : CPUv1_top port map(clk => clk_sig, rst => rst_sig);


process begin --clk
    --wait for 10ns;
    clk_sig <= '0';
    wait for 10ns;
    clk_sig <= '1';
    wait for 10ns;

end process;

process begin --rst
    rst_sig <= '1';
    wait for 10ns;
    rst_sig <= '0';
    wait;

end process;



end Behavioral;
