library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ROM_TB is
end ROM_TB;

architecture Behavioral of ROM_TB is
    -- Component Declaration
    component ROM
        port (
            enable_in : in std_logic;
            address_in : in std_logic_vector(7 downto 0);
            instruction_out : out std_logic_vector(15 downto 0);
            ROM_buffer_enable_out : out std_logic
        );
    end component;
    
    -- Test Signals
    signal enable_tb : std_logic := '0';
    signal address_tb : std_logic_vector(7 downto 0) := (others => '0');
    signal instruction_tb : std_logic_vector(15 downto 0);
    signal rom_buffer_enable_tb : std_logic;
    
    -- Clock period definition
    constant CLK_PERIOD : time := 10 ns;
    
begin
    -- Instantiate the Unit Under Test (UUT)
    UUT: ROM port map (
        enable_in => enable_tb,
        address_in => address_tb,
        instruction_out => instruction_tb,
        ROM_buffer_enable_out => rom_buffer_enable_tb
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
        wait for CLK_PERIOD * 2;
        
        -- Test address 0 (should contain "0000000000010010")
        address_tb <= x"00";
        wait for CLK_PERIOD * 2;
        assert instruction_tb = "0000000000010010" 
            report "Failed at address 0 - Expected 0000000000010010" 
            severity error;
        
        -- Test some other addresses (should contain all zeros)
        address_tb <= x"01";
        wait for CLK_PERIOD * 2;
        assert instruction_tb = x"0000" 
            report "Failed at address 1 - Expected 0000" 
            severity error;
        
        address_tb <= x"FF";  -- Test highest address
        wait for CLK_PERIOD * 2;
        assert instruction_tb = x"0000" 
            report "Failed at highest address - Expected 0000" 
            severity error;
        
        address_tb <= x"7F";  -- Test middle address
        wait for CLK_PERIOD * 2;
        assert instruction_tb = x"0000" 
            report "Failed at middle address - Expected 0000" 
            severity error;
        
        -- Test ROM buffer enable signal timing
        address_tb <= x"00";
        wait until rising_edge(enable_tb);
        assert rom_buffer_enable_tb = '1' 
            report "ROM buffer enable not set on rising edge" 
            severity error;
        
        wait until falling_edge(enable_tb);
        assert rom_buffer_enable_tb = '0' 
            report "ROM buffer enable not cleared on falling edge" 
            severity error;
        
        -- Test rapid address changes
        address_tb <= x"00";
        wait for CLK_PERIOD;
        address_tb <= x"01";
        wait for CLK_PERIOD;
        address_tb <= x"02";
        wait for CLK_PERIOD;
        
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