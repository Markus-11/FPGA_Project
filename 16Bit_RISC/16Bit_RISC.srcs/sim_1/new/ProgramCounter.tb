library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ProgramCounter_TB is
end ProgramCounter_TB;

architecture Behavioral of ProgramCounter_TB is
    -- Component Declaration
    component ProgramCounter
        Port (
            RESET_in   : in  STD_LOGIC;
            enable_in : in STD_LOGIC;
            pc_out  : out STD_LOGIC_VECTOR(7 downto 0);
            ROM_enable_m_out: out std_logic
        );
    end component;
    
    -- Signal Declaration
    signal reset_tb : STD_LOGIC := '0';
    signal enable_tb : STD_LOGIC := '0';
    signal pc_out_tb : STD_LOGIC_VECTOR(7 downto 0);
    signal rom_enable_tb : STD_LOGIC;
    
    -- Clock period definition
    constant CLK_PERIOD : time := 10 ns;
    
begin
    -- Instantiate the Unit Under Test (UUT)
    UUT: ProgramCounter port map (
        RESET_in => reset_tb,
        enable_in => enable_tb,
        pc_out => pc_out_tb,
        ROM_enable_m_out => rom_enable_tb
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
        
        -- Test normal counting
        wait for CLK_PERIOD * 10;  -- Let it count up a few times
        
        -- Test reset
        reset_tb <= '1';
        wait for CLK_PERIOD * 2;
        reset_tb <= '0';
        
        -- Test counting after reset
        wait for CLK_PERIOD * 10;
        
        -- Test overflow condition
        -- Force PC_REG to 126 to test overflow
        wait for CLK_PERIOD * 115;  -- Wait enough cycles to get close to 127
        
        -- Continue for a few more cycles to observe overflow behavior
        wait for CLK_PERIOD * 5;
        
        -- Test reset again
        reset_tb <= '1';
        wait for CLK_PERIOD * 2;
        reset_tb <= '0';
        
        -- Let it run a bit more
        wait for CLK_PERIOD * 10;
        
        -- End simulation
        wait;
    end process;

    -- Monitor process to check outputs
    monitor_proc: process
    begin
        wait for CLK_PERIOD;
        
        -- Print initial state
        report "Simulation starting..." severity note;
        
        while true loop
            wait until rising_edge(enable_tb);
            report "PC Value: " & integer'image(to_integer(unsigned(pc_out_tb))) &
                  " ROM Enable: " & std_logic'image(rom_enable_tb) &
                  " Reset: " & std_logic'image(reset_tb);
        end loop;
    end process;

end Behavioral;