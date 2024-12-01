library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU_tb is
end ALU_tb;

architecture Behavioral of ALU_tb is
    -- Component Declaration
    component ALU
        Port (
            reset_in             : in STD_LOGIC;
            A_data_in            : in STD_LOGIC_VECTOR(15 downto 0);
            B_data_in            : in STD_LOGIC_VECTOR(15 downto 0);
            opcode_in            : in STD_LOGIC_VECTOR(3 downto 0);
            enable_in            : in std_logic;
            ALU_result_out       : out STD_LOGIC_VECTOR(15 downto 0);
            REG_write_enable_out : out STD_logic
        );
    end component;
    
    -- Testbench Signals
    signal tb_reset             : STD_LOGIC := '0';
    signal tb_A_data           : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal tb_B_data           : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal tb_opcode           : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal tb_enable           : std_logic := '0';
    signal tb_ALU_result       : STD_LOGIC_VECTOR(15 downto 0);
    signal tb_REG_write_enable : STD_logic;
    
    -- Clock period definitions
    constant CLOCK_PERIOD : time := 10 ns;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: ALU port map (
        reset_in => tb_reset,
        A_data_in => tb_A_data,
        B_data_in => tb_B_data,
        opcode_in => tb_opcode,
        enable_in => tb_enable,
        ALU_result_out => tb_ALU_result,
        REG_write_enable_out => tb_REG_write_enable
    );

    -- Clock process
    clock_process: process
    begin
        tb_enable <= '0';
        wait for CLOCK_PERIOD/2;
        tb_enable <= '1';
        wait for CLOCK_PERIOD/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Reset Test
        tb_reset <= '1';
        wait for CLOCK_PERIOD;
        tb_reset <= '0';
        wait for CLOCK_PERIOD;

        -- Test Addition (0000)
        tb_opcode <= "0000";
        tb_A_data <= x"000A"; -- 10
        tb_B_data <= x"0005"; -- 5
        wait for CLOCK_PERIOD;
        assert tb_ALU_result = x"000F" -- Expected: 15
            report "Addition test failed" severity error;
            
        -- Test Subtraction (0001)
        tb_opcode <= "0001";
        tb_A_data <= x"000A"; -- 10
        tb_B_data <= x"0005"; -- 5
        wait for CLOCK_PERIOD;
        assert tb_ALU_result = x"0005" -- Expected: 5
            report "Subtraction test failed" severity error;
            
        -- Test AND (0010)
        tb_opcode <= "0010";
        tb_A_data <= x"00FF";
        tb_B_data <= x"0F0F";
        wait for CLOCK_PERIOD;
        assert tb_ALU_result = x"000F"
            report "AND test failed" severity error;
            
        -- Test OR (0011)
        tb_opcode <= "0011";
        tb_A_data <= x"00FF";
        tb_B_data <= x"0F00";
        wait for CLOCK_PERIOD;
        assert tb_ALU_result = x"0FFF"
            report "OR test failed" severity error;
            
        -- Test XOR (0100)
        tb_opcode <= "0100";
        tb_A_data <= x"00FF";
        tb_B_data <= x"0F0F";
        wait for CLOCK_PERIOD;
        assert tb_ALU_result = x"0FF0"
            report "XOR test failed" severity error;
            
        -- Test NOT (0101)
        tb_opcode <= "0101";
        tb_A_data <= x"00FF";
        wait for CLOCK_PERIOD;
        assert tb_ALU_result = x"FF00"
            report "NOT test failed" severity error;
            
        -- Test Left Shift (0110)
        tb_opcode <= "0110";
        tb_A_data <= x"0001";
        wait for CLOCK_PERIOD;
        assert tb_ALU_result = x"0002"
            report "Left shift test failed" severity error;
            
        -- Test Right Shift (0111)
        tb_opcode <= "0111";
        tb_A_data <= x"0002";
        wait for CLOCK_PERIOD;
        assert tb_ALU_result = x"0001"
            report "Right shift test failed" severity error;
            
        -- Test Increment (1000)
        tb_opcode <= "1000";
        tb_A_data <= x"0005";
        wait for CLOCK_PERIOD;
        assert tb_ALU_result = x"0006"
            report "Increment test failed" severity error;
            
        -- Test Decrement (1001)
        tb_opcode <= "1001";
        tb_A_data <= x"0005";
        wait for CLOCK_PERIOD;
        assert tb_ALU_result = x"0004"
            report "Decrement test failed" severity error;
            
        -- Test Equal (1010)
        tb_opcode <= "1010";
        tb_A_data <= x"0005";
        tb_B_data <= x"0005";
        wait for CLOCK_PERIOD;
        assert tb_ALU_result = x"0000"
            report "Equal test (equal case) failed" severity error;
            
        tb_B_data <= x"0006";
        wait for CLOCK_PERIOD;
        assert tb_ALU_result = x"FFFF"
            report "Equal test (not equal case) failed" severity error;
            
        -- Test Greater Than (1011)
        tb_opcode <= "1011";
        tb_A_data <= x"0006";
        tb_B_data <= x"0005";
        wait for CLOCK_PERIOD;
        assert tb_ALU_result = x"FFFF"
            report "Greater than test (true case) failed" severity error;
            
        tb_A_data <= x"0004";
        wait for CLOCK_PERIOD;
        assert tb_ALU_result = x"0000"
            report "Greater than test (false case) failed" severity error;

        -- Test invalid opcode
        tb_opcode <= "1111";
        wait for CLOCK_PERIOD;
        assert tb_ALU_result = x"0000"
            report "Invalid opcode test failed" severity error;

        -- End simulation
        wait for CLOCK_PERIOD;
        wait;
    end process;
end Behavioral;