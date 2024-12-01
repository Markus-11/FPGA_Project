library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Decoder is
   Port(
    reset_in: in std_logic;
    instruction_in: in std_logic_vector (15 downto 0);
    enable_in: in std_logic;
    opcode_out: out std_logic_vector (3 downto 0);
    dest_reg_out: out std_logic_vector (3 downto 0);
    src_reg1_out: out std_logic_vector(3 downto 0);
    src_reg2_out: out std_logic_vector(3 downto 0);
    ram_addr_out: out std_logic_vector (7 downto 0);
    DEC_buffer_enable_out: out std_logic
    );
end Decoder;

architecture Behavioral of Decoder is
begin
    process (enable_in)
        begin
            if rising_edge (enable_in) then
                opcode_out<=instruction_in(15 downto 12);   --send to ALU
                dest_reg_out<=instruction_in(11 downto 8);  --send to Register File
                
                if (instruction_in (15 downto 12) = "1101" or instruction_in (15 downto 12) = "1100") then  
                    ram_addr_out<=instruction_in (7 downto 0); --send to Register File
                    src_reg1_out <= (others => '0');  -- Clear unused outputs
                    src_reg2_out <= (others => '0');
                else
                    ram_addr_out<= (others => '0');
                    src_reg1_out<=instruction_in(7 downto 4);  --send to Register File
                    src_reg2_out<=instruction_in(3 downto 0);  --send to Register File
                end if;
                DEC_buffer_enable_out<= '1';
            end if;   
            if falling_edge (enable_in) then
                DEC_buffer_enable_out<= '0';
            end if;
        end process;
end Behavioral;