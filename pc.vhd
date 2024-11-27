----------------------------------------------------------------------------------
-- Company: DHBW
-- Engineer: Johannes Messner
-- 
-- Create Date: 23.11.2024 19:28:12
-- Design Name: Program counter
-- Module Name: pc - Behavioral
-- Project Name: 16 Bit RISC 
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



entity ProgramCounter is
    Port (
        CLK     : in  STD_LOGIC;      -- Clock signal
        RESET   : in  STD_LOGIC;      -- Reset signal
        pc_in   : in  STD_LOGIC_VECTOR(15 downto 0); -- Input address
        pc_out  : out STD_LOGIC_VECTOR(15 downto 0)  -- Output to other entities
    );
end ProgramCounter;

architecture Behavioral of ProgramCounter is
    signal PC_REG : STD_LOGIC_VECTOR(15 downto 0) := (others => '0'); --set program counter to 0 --> all bits set to 0
begin
    PC_REG <= PC_IN;
    process (CLK, RESET)
    begin    
     if rising_edge(CLK) then   
        
            if unsigned(PC_REG) > 127 then -- reset the program counter if register 128 is reached
                PC_REG <= (others => '0');
            else
                -- if its not over 128 then increment by 1
                PC_REG <= STD_LOGIC_VECTOR(unsigned(PC_REG) + 1);
            end if;
            if RESET = '1' then -- reset the program counter value if reset signal is 1 (HIGH)
                PC_REG <= (others => '0'); -- set all bits back to 1
            end if;
     end if; 
     
     end process;
    -- Assign internal value to thr output
    pc_out <= PC_REG;

end Behavioral;