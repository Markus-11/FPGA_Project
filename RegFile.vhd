library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RegisterFile is
    Port (
        clk_in            : in STD_LOGIC;                       -- Clock-Signal
        reset_in          : in STD_LOGIC;                       -- Reset-Signal
        write_enable_in   : in STD_LOGIC;                       -- Allow write in reg
        read_enable_in    : in STD_LOGIC;                       -- Allow read from reg to ram
        result_addr_in    : in STD_LOGIC_VECTOR(3 downto 0);    -- Address for write to register
        result_data_in    : in STD_LOGIC_VECTOR(15 downto 0);   -- Data for write to register
        A_addr_in         : in STD_LOGIC_VECTOR(3 downto 0);    -- Address for Read-Channel 1
        B_addr_in         : in STD_LOGIC_VECTOR(3 downto 0);    -- Address for Read-Channel 2
        A_data_out        : out STD_LOGIC_VECTOR(15 downto 0);  -- Data for ALU 1
        B_data_out        : out STD_LOGIC_VECTOR(15 downto 0);  -- Data for ALU 2
        ram_data_out      : out STD_LOGIC_VECTOR(15 downto 0)   -- Write data in RAM
        
    );
end RegisterFile;

architecture Behavioral of RegisterFile is                      -- Register-Memory: 16 register, 16 Bit wide
    type reg_file_type is array (0 to 15) of STD_LOGIC_VECTOR(15 downto 0);
    signal reg_file : reg_file_type := (others => (others => '0'));
begin
    process(clk_in)
    begin
        if reset_in = '1' then                                  -- Set all register to 0
            reg_file <= (others => (others => '0'));
        elsif rising_edge(clk_in) then
            if write_enable_in = '1' then                       -- Write data in target-register
                reg_file(to_integer(unsigned(result_addr_in))) <= result_data_in;
            end if;
            if read_enable_in = '1' then
                ram_data_out <= reg_file(to_integer(unsigned(result_addr_in)));
            end if;
        end if;
    end process;

    -- Lese die Daten aus den angegebenen Adressen
    A_data_out <= reg_file(to_integer(unsigned(A_addr_in)));
    B_data_out <= reg_file(to_integer(unsigned(B_addr_in)));
end Behavioral;