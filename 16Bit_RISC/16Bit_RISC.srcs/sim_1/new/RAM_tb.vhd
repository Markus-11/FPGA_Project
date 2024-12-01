library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity RAM_tb is
-- Keine Ports, da dies eine Testbench ist
end RAM_tb;

architecture Behavioral of RAM_tb is
    -- RAM-Typ und RAM-Signal
    type ram_type is array (0 to 12) of std_logic_vector(15 downto 0);
    signal RAM : ram_type := (others => (others => '0')); -- RAM-Inhalt

    -- Signale zur Simulation
    signal RAM_enable_s_in      : std_logic := '0';
    signal RAM_enable_l_in      : std_logic := '0';
    signal REG_enable_l_out     : std_logic;
    signal reset_in             : std_logic := '0';
    signal address_in           : std_logic_vector(7 downto 0) := (others => '0');
    signal data_in              : std_logic_vector(15 downto 0) := (others => '0');
    signal data_out             : std_logic_vector(15 downto 0);

    -- Taktperiode für die Simulation
    constant clk_period : time := 10 ns;

begin

    -- Stimulus-Prozess für Schreib- und Leseoperationen
    stimulus: process
        variable expected_data : std_logic_vector(15 downto 0); -- Zum Vergleich bei Leseoperationen
    begin
        -- Reset
        reset_in <= '1';
        wait for clk_period;
        reset_in <= '0';
        wait for clk_period;

        -- Schreibe Daten in den RAM
        report "Schreibe Daten in den RAM...";
        for i in 0 to 9 loop
            address_in <= std_logic_vector(to_unsigned(i, 8)); -- Adresse setzen
            data_in <= std_logic_vector(to_unsigned(i * 10, 16)); -- Daten setzen
            RAM(to_integer(unsigned(address_in))) <= data_in; -- Daten direkt schreiben
            wait for clk_period;

            -- Bestätigung ausgeben

        end loop;

        -- Lese Daten aus dem RAM und vergleiche
        report "Lese und überprüfe Daten aus dem RAM...";
        for i in 0 to 9 loop
            address_in <= std_logic_vector(to_unsigned(i, 8)); -- Adresse setzen
            data_out <= RAM(to_integer(unsigned(address_in))); -- Daten lesen
            expected_data := std_logic_vector(to_unsigned(i * 10, 16)); -- Erwarteter Wert

            wait for clk_period;


        end loop;

        -- Simulation beenden
        report "Simulation abgeschlossen!";
        wait;
    end process;

end Behavioral;
