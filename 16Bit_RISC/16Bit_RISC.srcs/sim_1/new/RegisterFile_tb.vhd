library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RegisterFile_tb is
-- Keine Ports, da dies eine Testbench ist
end RegisterFile_tb;

architecture Behavioral of RegisterFile_tb is

    -- Komponenten-Deklaration für den zu testenden RegisterFile
    component RegisterFile
        port (
            reset_in          : in STD_LOGIC;
            enable_in         : in std_logic;
            RAM_enable_s_out  : out std_logic;
            REG_enable_l_in   : in std_logic;
            REG_enable_s_in   : in std_logic;
            REG_enable_wb_in  : in std_logic;
            result_addr_in    : in STD_LOGIC_VECTOR(3 downto 0);
            result_data_in    : in STD_LOGIC_VECTOR(15 downto 0);
            A_addr_in         : in STD_LOGIC_VECTOR(3 downto 0);
            B_addr_in         : in STD_LOGIC_VECTOR(3 downto 0);
            data_from_RAM_in  : in std_logic_vector (15 downto 0);
            A_data_out        : out STD_LOGIC_VECTOR(15 downto 0);
            B_data_out        : out STD_LOGIC_VECTOR(15 downto 0);
            ram_data_out      : out STD_LOGIC_VECTOR(15 downto 0);
            enable_ALU_m_out  : out std_logic
        );
    end component;

    -- Signale zur Simulation
    signal reset_in          : std_logic := '0';
    signal enable_in         : std_logic := '0';
    signal RAM_enable_s_out  : std_logic;
    signal REG_enable_l_in   : std_logic := '0';
    signal REG_enable_s_in   : std_logic := '0';
    signal REG_enable_wb_in  : std_logic := '0';
    signal result_addr_in    : std_logic_vector(3 downto 0) := (others => '0');
    signal result_data_in    : std_logic_vector(15 downto 0) := (others => '0');
    signal A_addr_in         : std_logic_vector(3 downto 0) := (others => '0');
    signal B_addr_in         : std_logic_vector(3 downto 0) := (others => '0');
    signal data_from_RAM_in  : std_logic_vector(15 downto 0) := (others => '0');
    signal A_data_out        : std_logic_vector(15 downto 0);
    signal B_data_out        : std_logic_vector(15 downto 0);
    signal ram_data_out      : std_logic_vector(15 downto 0);
    signal enable_ALU_m_out  : std_logic;

    -- Taktperiode für die Tests
    constant clk_period : time := 10 ns;

begin

    -- Instanziere den zu testenden RegisterFile
    uut: RegisterFile
        port map(
            reset_in          => reset_in,
            enable_in         => enable_in,
            RAM_enable_s_out  => RAM_enable_s_out,
            REG_enable_l_in   => REG_enable_l_in,
            REG_enable_s_in   => REG_enable_s_in,
            REG_enable_wb_in  => REG_enable_wb_in,
            result_addr_in    => result_addr_in,
            result_data_in    => result_data_in,
            A_addr_in         => A_addr_in,
            B_addr_in         => B_addr_in,
            data_from_RAM_in  => data_from_RAM_in,
            A_data_out        => A_data_out,
            B_data_out        => B_data_out,
            ram_data_out      => ram_data_out,
            enable_ALU_m_out  => enable_ALU_m_out
        );

    -- Testprozess
    stimulus: process
        variable expected_value : std_logic_vector(15 downto 0);
    begin
        -- **1. Reset Test**
        report "1. Reset Test";
        reset_in <= '1';
        wait for clk_period;
        reset_in <= '0';
        wait for clk_period;

        -- Überprüfe, ob alle Register zurückgesetzt wurden
        result_addr_in <= "0000"; -- Adresse 0
        enable_in <= '1';
        wait for clk_period;
        enable_in <= '0';
        wait for clk_period;


        -- **2. Writeback Test**
        report "2. Writeback Test";
        result_addr_in <= "0001"; -- Adresse 1
        result_data_in <= "1010101010101010"; -- Wert
        REG_enable_wb_in <= '1';
        wait for clk_period;
        REG_enable_wb_in <= '0';
        wait for clk_period;

        -- **3. Read Test**
        report "3. Read Test";
        A_addr_in <= "0001"; -- Lese Adresse 1
        enable_in <= '1';
        wait for clk_period;
        enable_in <= '0';
        wait for clk_period;

            -- **4. RAM Load Test**
        result_addr_in <= "0010"; -- Adresse 2
        data_from_RAM_in <= "1111000011110000"; -- Wert vom RAM
        REG_enable_l_in <= '1';
        wait for clk_period;
        REG_enable_l_in <= '0';
        wait for clk_period;

        -- **5. RAM Store Test**
        report "5. RAM Store Test";
        result_addr_in <= "0010"; -- Adresse 2
        REG_enable_s_in <= '1';
        wait for clk_period;
        REG_enable_s_in <= '0';
        wait for clk_period;

       
        -- **6. Multiple Write and Read Test**
        for i in 0 to 15 loop
            result_addr_in <= std_logic_vector(to_unsigned(i, 4));
            result_data_in <= std_logic_vector(to_unsigned(i * 5, 16));
            REG_enable_wb_in <= '1';
            wait for clk_period;
            REG_enable_wb_in <= '0';
            wait for clk_period;
        end loop;

        for i in 0 to 15 loop
            A_addr_in <= std_logic_vector(to_unsigned(i, 4));
            enable_in <= '1';
            wait for clk_period;
            enable_in <= '0';
            expected_value := std_logic_vector(to_unsigned(i * 5, 16));
           
        end loop;

        -- **Ende der Simulation**
        report "Simulation abgeschlossen.";
        wait;
    end process;

end Behavioral;
