library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RAM is
    port (
        RAM_enable_s_in      : in std_logic;                    
        RAM_enable_l_in : in std_logic ;
        REG_enable_l_out    : out std_logic ;
        reset_in        : in std_logic;                     -- Zurücksetzen des Speichers
        address_in      : in std_logic_vector(7 downto 0);  -- Adresse
        data_in         : in std_logic_vector(15 downto 0); -- Eingabedaten
        data_out        : out std_logic_vector(15 downto 0) -- Ausgabedaten
    );
end RAM;

architecture Behavioral of RAM is
    -- Definiere RAM als ein Array mit 256 Einträgen
    type ram_type is array (0 to 255) of std_logic_vector(15 downto 0);
    signal RAM : ram_type := (
        0 => "0000000000000001", -- Wert für Adresse 0
        1 => "0000000000000010", -- Wert für Adresse 1
        2 => "0000000000000011", -- Wert für Adresse 2
        3 => "0000000000000100", -- Wert für Adresse 3
        4 => "0000000000000101", -- Wert für Adresse 4
        5 => "0000000000000110", -- Wert für Adresse 5
        6 => "0000000000000111", -- Wert für Adresse 6
        7 => "0000000000001000", -- Wert für Adresse 7
        8 => "0000000000001001", -- Wert für Adresse 8
        9 => "0000000000001010", -- Wert für Adresse 9    
        others => (others => '0')
   );
begin
    -- Hauptprozess für den RAM
    process(RAM_enable_l_in)
    begin
        if rising_edge(RAM_enable_l_in) then
            DATA_OUT <= RAM(to_integer(unsigned(ADDRESS_IN)));
            REG_enable_l_out <='1';
        end if;
        if falling_edge (RAM_enable_l_in) then
            REG_enable_l_out <= '0';
        end if;
        
    end process;
--store
    process (RAM_enable_s_in)
    begin 
        if rising_edge (RAM_enable_s_in) then
            RAM(to_integer(unsigned(ADDRESS_IN))) <= DATA_IN;
        end if;
    end process;
end Behavioral;
