library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RAM is
    generic (
        DATA_WIDTH : integer := 16; -- Breite der Daten
        ADDR_WIDTH : integer := 8   -- Breite der Adresse
    );
    port (
        CLK_IN          : in std_logic;                     -- Clock Signal
        enable_in       : in std_logic;                     -- Aktivierung des Moduls
        reset_in        : in std_logic;                     -- Zurücksetzen des Speichers
        write_enable_in : in std_logic;                     -- Schreiberlaubnis
        address_in      : in std_logic_vector(7 downto 0);  -- Adresse
        data_in         : in std_logic_vector(15 downto 0); -- Eingabedaten
        data_out        : out std_logic_vector(15 downto 0) -- Ausgabedaten
    );
end RAM;

architecture Behavioral of RAM is
    -- Definiere RAM als ein Array mit 256 Einträgen
    type ram_type is array (0 to 255) of std_logic_vector(15 downto 0);
    signal RAM : ram_type := (others => (others => '0'));
    signal temp_data_out : std_logic_vector(15 downto 0);
begin
    -- Hauptprozess für den RAM
    process(CLK_IN)
    begin
        if rising_edge(CLK_IN) then
            if RESET_IN = '1' then
                -- Alle Speicherplätze auf 0 zurücksetzen
                RAM <= (others => (others => '0'));
                temp_data_out <= (others => '0');
            elsif ENABLE_IN = '1' then
                if WRITE_ENABLE_IN = '1' then
                    -- Schreibe Daten in den RAM
                    RAM(to_integer(unsigned(ADDRESS_IN))) <= DATA_IN;
                else
                    -- Lese Daten aus dem RAM
                    temp_data_out <= RAM(to_integer(unsigned(ADDRESS_IN)));
                end if;
            end if;
        end if;
    end process;

    -- Ausgabedaten zuweisen
    DATA_OUT <= temp_data_out;
end Behavioral;
