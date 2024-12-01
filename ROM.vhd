library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ROM is
    port (
        enable_in : in std_logic;
        address_in : in std_logic_vector(7 downto 0); -- Adresse
        instruction_out   : out std_logic_vector(15 downto 0); -- Ausgabedaten
        ROM_buffer_enable_out: out std_logic 
    );
end ROM;

architecture Behavioral of ROM is
    -- Definiere ROM als ein Array mit 256 Einträgen
    type rom_type is array (0 to 255) of std_logic_vector(15 downto 0);
    constant ROM : rom_type := (
        0 => "0000" & "0000" & "0001" & "0010",
        others => (others => '0') -- Rest auf 0 initialisieren
    );
begin
    process(enable_in)
    begin
        if rising_edge (enable_in) then
            -- Gib die Daten an der angegebenen Adresse aus
            instruction_out <= ROM(to_integer(unsigned(ADDRESS_IN)));
            ROM_buffer_enable_out<='1';
        end if;
        if falling_edge (enable_in) then
            ROM_buffer_enable_out <='0';
        end if;
    end process;
end Behavioral;