library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ROM is
    generic (
        DATA_WIDTH : integer := 16; -- Breite der Daten
        ADDR_WIDTH : integer := 8   -- Breite der Adresse
    );
    port (
        address_in : in std_logic_vector(7 downto 0); -- Adresse
        data_out   : out std_logic_vector(15 downto 0) -- Ausgabedaten
    );
end ROM;

architecture Behavioral of ROM is
    -- Definiere ROM als ein Array mit 256 Einträgen
    type rom_type is array (0 to 255) of std_logic_vector(15 downto 0);
    constant ROM : rom_type := (
        0 => '0' & "1011" & "000" & x"0A", -- imm r0 = 0x000A
        1 => '0' & "1011" & "001" & x"AA", -- imm r1 = 0x00AA
        2 => '0' & "0010" & "001" & "001" & "00000", -- not r1 = xFF55
        3 => '0' & "0000" & "010" & "001" & "000" & "00", -- ADD r2 r1 r0, r2 = xFF5F
        4 => '0' & "1011" & "011" & x"08", -- imm r3 = 0x08
        5 => '0' & "0110" & "010" & "010" & "011" & "00", -- LSL r2 by r3, r2 = x5F00
        6 => '0' & "1011" & "100" & x"04", -- imm r4 = 0x04
        7 => '0' & "0111" & "010" & "010" & "100" & "00", -- LSR r2 by r4, r2 = x05F0
        8 => '1' & "1001" & "000" & x"0B", -- Branch to ROM address 11
        others => (others => '0') -- Rest auf 0 initialisieren
    );
begin
    process(ADDRESS_IN)
    begin
        -- Gib die Daten an der angegebenen Adresse aus
        DATA_OUT <= ROM(to_integer(unsigned(ADDRESS_IN)));
    end process;
end Behavioral;
