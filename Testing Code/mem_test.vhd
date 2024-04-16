----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2024 12:10:59 AM
-- Design Name: 
-- Module Name: mem_test - Behavioral
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

entity mem_test is
--  Port ( );
end mem_test;

architecture Behavioral of mem_test is


component gen_RAM IS
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END component gen_RAM;


component mem_sys is -- RAM
    Port ( 
        mem_addr : in std_logic_vector(8 downto 0);
        ram_din : in std_logic_vector(31 downto 0);
        clk,rst, en : in std_logic;
        we : in std_logic_vector(0 downto 0);
        mem_out : out std_logic_vector(31 downto 0)
      
      ); end component;
      
      signal clk_sig, rst_sig, en_sig : std_logic;
      signal we_sig : std_logic_vector(0 downto 0);
      signal ram_din, mem_out : std_logic_vector(31 downto 0);
      signal mem_addr : std_logic_vector(8 downto 0);

begin

    uut : gen_RAM port map(addra => mem_addr, dina => ram_din, clka => clk_sig, ena => en_sig, wea => we_sig, douta => mem_out);

    process begin
        clk_sig <= '0';
        wait for 10ns;
        clk_sig <= '1';
        wait for 10ns;
        
    end process;
    
    process begin
        rst_sig <= '1';
        ram_din <= x"00000000";
        we_sig <= "0";
        en_sig <= '1';
        wait for 10ns;
        rst_sig <= '0';
        wait;
    end process;
    
    process begin
        mem_addr <= "000000000";
        wait for 50 ns;
        mem_addr <= "000000001";
        wait for 50ns;
        mem_addr <= "000000010";
        wait for 100 ns;
        mem_addr <= "000000011";
        wait for 50ns;
        mem_addr <= "000000100";
        wait for 50 ns;
        mem_addr <= "000000101";
        wait for 50ns;
        mem_addr <= "000000110";
        wait for 50 ns;
        mem_addr <= "000000111";
        wait for 50ns;
         mem_addr <= "000001000";
        wait for 50 ns;
        mem_addr <= "000001001";
        wait for 50ns;
        mem_addr <= "000001010";
        wait for 50 ns;
        mem_addr <= "000001011";
        wait for 50ns;
        mem_addr <= "000001100";
        wait for 50 ns;
        mem_addr <= "000001101";
        wait for 50ns;
        mem_addr <= "000001110";
        wait for 50 ns;
        mem_addr <= "000001111";
        wait for 50ns;
        mem_addr <= "000010000";
        wait for 50 ns;
        mem_addr <= "000010001";
        wait for 50ns;
        mem_addr <= "000010010";
        wait for 50 ns;
        mem_addr <= "000010011";
        wait for 50ns;
        mem_addr <= "000010100";
        wait for 50 ns;
        mem_addr <= "000010101";
        wait for 50ns;
        mem_addr <= "000010110";
        wait for 50 ns;
        mem_addr <= "000010111";
        wait for 50ns;
         mem_addr <= "000101000";
        wait for 50 ns;
        mem_addr <= "000011001";
        wait for 50ns;
        mem_addr <= "000011010";
        wait for 50 ns;
        mem_addr <= "000011011";
        wait for 50ns;
        mem_addr <= "000011100";
        wait for 50 ns;
        mem_addr <= "000011101";
        wait for 50ns;
        mem_addr <= "000011110";
        wait for 50 ns;
        mem_addr <= "000011111";
        wait for 50ns;
        
        
        wait;
    end process;

end Behavioral;
