
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM is
    port(
        address : in  std_logic_vector(3 downto 0);
        dout    : out std_logic_vector(31 downto 0)
    );
end entity ROM;

architecture RTL of ROM is
    type MEMORY_16_4 is array (0 to 15) of std_logic_vector(31 downto 0);
    constant ROM_16_4 : MEMORY_16_4 := (
        "10001100000000100000000000000000", -- LW R2, R0(0) ; loading 7 into R2
        "10001100000000110000000000000001", -- LW R3, R0(1) ; loading 2 into R3
        "00000000010000110010000000100101", -- OR R4, R2, R3 ; 7 or 2 => 7 (R4)
        "00000000100000100010100000100000", -- ADD R5, R4, R2 ; 7 + 7 = e (R5)
        "10101100000001010000000000000010", -- SW R0(2), R5 ; storing R5 into memory location 2
        "10001100000001110000000000000010", -- LW R7, R0(2) ; reloading the changed data from memory location 2
        "10001100000001100000000000000011", -- LW R6, R0(3) ; loading 14 into R6
        "00010000110001110000000000000011", -- BEQ R6, R7, hop(instruction 10) ; checking if R6 and R7 are equal (yes) and jumping to instruction 10/A;
        x"00000008",
        x"00000009",
        "00001000000000000000000000000000", -- jump loop(instruction 0) ; jumps to instruction 0, restarting the program
        x"0000000b",
        x"0000000c",
        x"0000000d",
        x"0000000e",
        x"0000000f"
    );
begin
    main : process(address)
    begin
        dout <= ROM_16_4(to_integer(unsigned(address)));
    end process main;

end architecture RTL;