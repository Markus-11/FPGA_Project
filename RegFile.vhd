library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RegisterFile is
    Port (
        reset_in          : in STD_LOGIC;                       -- Reset-Signal
        enable_in         : in std_logic;
        RAM_enable_s_out  : out std_logic;
        REG_enable_l_in   : in std_logic;
        REG_enable_s_in   : in std_logic;
        REG_enable_wb_in  : in std_logic;
        result_addr_in    : in STD_LOGIC_VECTOR(3 downto 0);    -- Address for write to register
        result_data_in    : in STD_LOGIC_VECTOR(15 downto 0);   -- Data for write to register
        A_addr_in         : in STD_LOGIC_VECTOR(3 downto 0);    -- Address for Read-Channel 1
        B_addr_in         : in STD_LOGIC_VECTOR(3 downto 0);    -- Address for Read-Channel 2
        data_from_RAM_in  : in std_logic_vector (15 downto 0);  -- Data from Ram
        A_data_out        : out STD_LOGIC_VECTOR(15 downto 0);  -- Data for ALU 1
        B_data_out        : out STD_LOGIC_VECTOR(15 downto 0);  -- Data for ALU 2
        ram_data_out      : out STD_LOGIC_VECTOR(15 downto 0);   -- Write data in RAM
        enable_ALU_m_out  : out std_logic
        
    );
end RegisterFile;

architecture Behavioral of RegisterFile is                      -- Register-Memory: 16 register, 16 Bit wide
    type reg_file_type is array (0 to 15) of STD_LOGIC_VECTOR(15 downto 0);
    signal reg_file : reg_file_type := (others => (others => '0'));
begin
    --normal processes
    process(enable_in)
    begin
        if reset_in = '1' then                                  -- Set all register to 0
            reg_file <= (others => (others => '0'));
        end if;
        if rising_edge(enable_in) then
            A_data_out <= reg_file(to_integer(unsigned(A_addr_in)));
            B_data_out <= reg_file(to_integer(unsigned(B_addr_in)));
            enable_ALU_m_out<='1';
        end if;
        if falling_edge (enable_in) then
            enable_ALU_m_out<='0';
        end if;
    end process;
    
    --process for load and store instructions
    process(REG_enable_l_in)
    begin
        if rising_edge (REG_enable_l_in) then
            reg_file(to_integer(unsigned(result_addr_in))) <= data_from_RAM_in; --RAM
               
        end if;
        end process;
        
    process (REG_enable_s_in)
    begin
        if rising_edge (REG_enable_s_in) then
            ram_data_out <= reg_file(to_integer(unsigned(result_addr_in)));
            RAM_enable_s_out <='1';
        end if;
        if falling_edge (REG_enable_s_in) then
            RAM_enable_s_out <= '0';
        end if;
    end process;
    
    process (REG_enable_wb_in)
    begin
        if rising_edge (REG_enable_wb_in) then
            reg_file(to_integer(unsigned(result_addr_in))) <= result_data_in;
        end if;
    end process;
end Behavioral;