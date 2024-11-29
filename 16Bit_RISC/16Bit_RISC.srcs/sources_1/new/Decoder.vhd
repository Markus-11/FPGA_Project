----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.11.2024 11:57:29
-- Design Name: 
-- Module Name: Decoder - Behavioral
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

entity Decoder is
   Port(
    clk: in std_logic;
    instruction_in: in std_logic_vector (15 downto 0);
    enabler_dec: in std_logic;
    opcode_out: out std_logic_vector (3 downto 0);
    dest_reg: out std_logic_vector (3 downto 0);
    src_reg1: out std_logic_vector(3 downto 0);
    src_reg2: out std_logic_vector(3 downto 0);
    ram_addr: out std_logic_vector (7 downto 0)
    );
end Decoder;

architecture Behavioral of Decoder is

begin
    process (clk)
        begin
            if rising_edge (clk) and enabler_dec='1' then
            
            opcode_out<=instruction_in(15 downto 12);   --send to ALU
            dest_reg<=instruction_in(11 downto 8);  --send to Register File
            src_reg1<=instruction_in(7 downto 4);  --send to Register File
            src_reg2<=instruction_in(3 downto 0);  --send to Register File
            ram_addr<=instruction_in (7 downto 0); --send to Register File
            
            end if;
        end process;

end Behavioral;
