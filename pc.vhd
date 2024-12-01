library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ProgramCounter is
    Port (
        RESET_in   : in  STD_LOGIC;      -- Reset signalf
        enable_in : in STD_LOGIC;
        pc_out  : out STD_LOGIC_VECTOR(7 downto 0);  -- Output to other entities
        ROM_enable_m_out: out std_logic
    );
end ProgramCounter;

architecture Behavioral of ProgramCounter is
    signal PC_REG : STD_LOGIC_VECTOR(7 downto 0) := (others => '0'); --set program counter to 0 --> all bits set to 0
    begin
    process (enable_in)
        begin
        if rising_edge(enable_in) then
            -- Assign internal value to thr output
            pc_out <= PC_REG;
                if unsigned(PC_REG) > 126 then -- reset the program counter if register 128 is reached
                    PC_REG <= (others => '0');
                else
                    -- if its not over 128 then increment by 1
                    PC_REG <= STD_LOGIC_VECTOR(unsigned(PC_REG) + 1);
                end if;
                if RESET_in = '1' then -- reset the program counter value if reset signal is 1 (HIGH)
                    PC_REG <= (others => '0'); -- set all bits back to 1
                end if;
            ROM_enable_m_out <= '1';
         end if;
         if falling_edge (enable_in) then
            ROM_enable_m_out <= '0';
         end if;
    end process;
end Behavioral;