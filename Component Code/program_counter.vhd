----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2024 05:34:23 PM
-- Design Name: 
-- Module Name: program_counter - Behavioral
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

entity program_counter is
  Port (
        clk : in std_logic; 
        PC_in : in std_logic_vector(4 downto 0);
        PC_out : out std_logic_vector(4 downto 0) := "00000"
        );
end program_counter;

architecture Behavioral of program_counter is

--signal instruction_counter : unsigned(4 downto 0) := "00000";
--signal cycle_counter : unsigned(1 downto 0) := "00";

begin
    
    process(clk) 
    variable cycle_counter : natural range 0 to 3;
    begin    
        if rising_edge(clk) then
            if pc_in = "01111" then
                pc_out <= "00000";
            elsif cycle_counter = 2 then
                pc_out <= pc_in;
                cycle_counter := 0;
            else
                cycle_counter := cycle_counter + 1;
            end if;
        end if;
    end process;
                
    
    
-- this is for 3 clock cycles per instruction. Does not work with  new branch and jump architecture

--    process(clk) begin
--        if rising_edge(clk) then
--            if instruction_counter = "1111" then
--                instruction_counter <= "0000";
--            elsif cycle_counter = "11" then
--                instruction_counter <= instruction_counter + 1;
--                cycle_counter <= "00";
--            else
--                cycle_counter <= cycle_counter + 1;
--                PC_out <= std_logic_vector(instruction_counter);
                
--            end if;
--         end if;  
         
         
        
--    end process;


end Behavioral;
