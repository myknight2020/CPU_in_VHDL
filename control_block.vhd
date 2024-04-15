----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/03/2024 03:03:24 PM
-- Design Name: 
-- Module Name: control_block - Behavioral
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

entity control_block is
  Port ( 
    instruction_input : in std_logic_vector(5 downto 0);
    RegDst, Branch, MemRead, MemtoReg, MemWrite,ALUsrc,RegWrite, Jump : out std_logic;
    ALUOp : out std_logic_vector(1 downto 0);
    clk : in std_logic
  );
end control_block;

architecture Behavioral of control_block is

begin
    
    process(clk) begin
        case(instruction_input) is
            when "000000" => ALUOp <= "10"; -- ADD, AND, or any ALU-based operation
                             RegDst <= '1';
                             Branch <= '0';
                             MemRead <= '0';
                             MemtoReg <= '0';
                             MemWrite <= '0';
                             ALUsrc <= '0';
                             Jump <= '0';
                             RegWrite <= '1';
             when "100011" => ALUOp <= "00"; --LW
                             RegDst <= '0';
                             Branch <= '0';
                             MemRead <= '1';
                             MemtoReg <= '1';
                             MemWrite <= '0';
                             ALUsrc <= '1';
                             Jump <= '0';
                             RegWrite <= '1';
             when "101011" => ALUOp <= "00"; --SW
                             RegDst <= '0';
                             Branch <= '0';
                             MemRead <= '1';
                             MemtoReg <= '0';
                             MemWrite <= '1';
                             ALUsrc <= '1';
                             Jump <= '0';
                             RegWrite <= '0';
              when "000100" =>  ALUOp <= "01"; 
                                RegDst <= '0';  
                                Branch <= '1';  
                                MemRead <= '0'; 
                                MemtoReg <= '0';
                                MemWrite <= '0';
                                ALUsrc <= '0';
                                Jump <= '0';  
                                RegWrite <= '0';
              when "000010" =>  ALUOp <= "00"; 
                                RegDst <= '0';  
                                Branch <= '1';  
                                MemRead <= '0'; 
                                MemtoReg <= '0';
                                MemWrite <= '0';
                                ALUsrc <= '0';
                                Jump <= '1';
                                RegWrite <= '0';
              when others => ALUOp <= "00"; --other cases
                             RegDst <= '0';
                             Branch <= '0';
                             MemRead <= '0';
                             MemtoReg <= '0';
                             MemWrite <= '0';
                             ALUsrc <= '0';
                             RegWrite <= '0';      
                       
        end case;
    
    
    end process;
        


end Behavioral;
