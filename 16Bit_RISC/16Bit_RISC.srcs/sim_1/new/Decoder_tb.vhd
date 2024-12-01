library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Decoder_TB is
end Decoder_TB;

architecture Behavioral of Decoder_TB is
    -- Component Declaration
    component Decoder
        Port(
            reset_in: in std_logic;
            instruction_in: in std_logic_vector(15 downto 0);
            enable_in: in std_logic;
            opcode_out: out std_logic_vector(3 downto 0);
            dest_reg_out: out std_logic_vector(3 downto 0);
            src_reg1_out: out std_logic_vector(3 downto 0);
            src_reg2_out: out std_logic_vector(3 downto 0);
            ram_addr_out: out std_logic_vector(7 downto 0);
            DEC_buffer_enable_out: out std_logic
        );
    end component;
    
    -- Test Signals
    signal reset_tb : std_logic := '0';
    signal instruction_tb : std_logic_vector(15 downto 0) := (others => '0');
    signal enable_tb : std_logic := '0';
    signal opcode_tb : std_logic_vector(3 downto 0);
    signal dest_reg_tb : std_logic_vector(3 downto 0);
    signal src_reg1_tb : std_logic_vector(3 downto 0);
    signal src_reg2_tb : std_logic_vector(3 downto 0);
    signal ram_addr_tb : std_logic_vector(7 downto 0);
    signal dec_buffer_enable_tb : std_logic;
    
    -- Clock period definition
    constant CLK_PERIOD : time := 10 ns;
    
begin
    -- Instantiate the Unit Under Test (UUT)
    UUT: Decoder port map (
        reset_in => reset_tb,
        instruction_in => instruction_tb,
        enable_in => enable_tb,
        opcode_out => opcode_tb,
        dest_reg_out => dest_reg_tb,
        src_reg1_out => src_reg1_tb,
        src_reg2_out => src_reg2_tb,
        ram_addr_out => ram_addr_tb,
        DEC_buffer_enable_out => dec_buffer_enable_tb
    );
    
    -- Clock process
    clock_process: process
    begin
        enable_tb <= '0';
        wait for CLK_PERIOD/2;
        enable_tb <= '1';
        wait for CLK_PERIOD/2;
    end process;
    
    -- Stimulus process
    stim_proc: process
    begin
        -- Initial wait
        wait for CLK_PERIOD;
        
        -- Test Case 1: Memory Load instruction (opcode 1101)
        -- Format: opcode(4) | dest_reg(4) | ram_addr(8)
        instruction_tb <= "1101" & "0001" & "10101010"; -- LOAD R1, [0xAA]
        wait for CLK_PERIOD * 2;
        assert opcode_tb = "1101" report "Failed opcode test for LOAD instruction" severity error;
        assert dest_reg_tb = "0001" report "Failed dest_reg test for LOAD instruction" severity error;
        assert ram_addr_tb = "10101010" report "Failed ram_addr test for LOAD instruction" severity error;
        
        -- Test Case 2: Regular instruction (ADD)
        -- Format: opcode(4) | dest_reg(4) | src_reg1(4) | src_reg2(4)
        instruction_tb <= "0001" & "1010" & "0011" & "0100"; -- ADD R10, R3, R4
        wait for CLK_PERIOD;
        assert opcode_tb = "0001" report "Failed opcode test for ADD instruction" severity error;
        assert dest_reg_tb = "1010" report "Failed dest_reg test for ADD instruction" severity error;
        assert src_reg1_tb = "0011" report "Failed src_reg1 test for ADD instruction" severity error;
        assert src_reg2_tb = "0100" report "Failed src_reg2 test for ADD instruction" severity error;
 
        -- Test Case 3: Memory Store instruction (opcode 1100)
        -- Format: opcode(4) | src_reg(4) | ram_addr(8)
        instruction_tb <= "1100" & "0010" & "11110000"; -- STORE R2, [0xF0]
        wait for CLK_PERIOD;
        assert opcode_tb = "1100" report "Failed opcode test for STORE instruction" severity error;
        assert dest_reg_tb = "0010" report "Failed dest_reg test for STORE instruction" severity error;
        assert ram_addr_tb = "11110000" report "Failed ram_addr test for STORE instruction" severity error;
        
        -- Test Case 4: Another regular instruction (SUB)
        instruction_tb <= "0010" & "0111" & "0001" & "0010"; -- SUB R7, R1, R2
        wait for CLK_PERIOD;
        assert opcode_tb = "0010" report "Failed opcode test for SUB instruction" severity error;
        assert dest_reg_tb = "0111" report "Failed dest_reg test for SUB instruction" severity error;
        assert src_reg1_tb = "0001" report "Failed src_reg1 test for SUB instruction" severity error;
        assert src_reg2_tb = "0010" report "Failed src_reg2 test for SUB instruction" severity error;
        
        -- Test buffer enable timing
        wait until rising_edge(enable_tb);
        assert dec_buffer_enable_tb = '1' 
            report "DEC buffer enable not set on rising edge" 
            severity error;
            
        wait until falling_edge(enable_tb);
        assert dec_buffer_enable_tb = '0' 
            report "DEC buffer enable not cleared on falling edge" 
            severity error;
        
        -- Report end of test
        report "Test completed successfully"
            severity note;
            
        -- End simulation
        wait;
    end process;
    
    -- Monitor process
    monitor_proc: process
    begin
        wait for CLK_PERIOD;
        
        -- Print initial state
        report "Simulation starting..." severity note;
        
        while true loop
            wait until rising_edge(enable_tb);
        end loop;
    end process;

end Behavioral;