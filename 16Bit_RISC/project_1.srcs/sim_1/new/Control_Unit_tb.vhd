----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.11.2024 11:23:32
-- Design Name: 
-- Module Name: Control_Unit_tb
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Testbench für die Control_Unit
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Control_Unit_tb is
    -- Die Testbench hat keine Ports
end Control_Unit_tb;

architecture behavior of Control_Unit_tb is
    -- Testbench-Signale
    signal clk: std_logic := '0';
    signal reset: std_logic := '0';
    signal alu_op_in: std_logic_vector(3 downto 0) := "0000";
    signal enabler: std_logic_vector(3 downto 0);
    signal stage_enable: std_logic := '0';
    signal stage: std_logic;
    signal enable_fet: std_logic;
    signal enable_dec: std_logic;
    signal enable_exe: std_logic;
    signal enable_wb: std_logic;

    -- Instanziierung der Control_Unit
    component Control_Unit
        Port(
            clk: in std_logic;
            alu_op_in: in std_logic_vector(3 downto 0);
            enabler: out std_logic_vector(3 downto 0);
            reset: in std_logic;
            stage_enable: in std_logic;
            stage: out std_logic;
            enable_fet: out std_logic;
            enable_dec: out std_logic;
            enable_exe: out std_logic;
            enable_wb: out std_logic
        );
    end component;

begin
    -- Instanziierung der Control_Unit
    uut: Control_Unit
        Port map(
            clk => clk,
            alu_op_in => alu_op_in,
            enabler => enabler,
            reset => reset,
            stage_enable => stage_enable,
            stage => stage,
            enable_fet => enable_fet,
            enable_dec => enable_dec,
            enable_exe => enable_exe,
            enable_wb => enable_wb
        );

    -- Taktgeber (clk)
    clk_process: process
    begin
        clk <= not clk after 10 ns;
        wait for 10 ns;
    end process;

    -- Testvorgang
    stim_proc: process
    begin
        -- Initialisierung
        reset <= '1';
        stage_enable <= '1'; -- Stage-Enable aktivieren
        wait for 20 ns;

        -- Reset wird deaktiviert
        reset <= '0';
        wait for 20 ns;

        -- Warten und Beobachten der Zustandsübergänge
        -- Zustand: fetch -> decode -> execute -> writeback -> fetch -> ...
        
        -- Test 1: Übergang durch alle Zustände
        wait for 40 ns;  -- Ein Zyklus in jedem Zustand
        assert (enable_fet = '1') report "Error: enable_fet sollte '1' sein" severity error;
        wait for 40 ns;  -- Warten auf den nächsten Zustand
        assert (enable_dec = '1') report "Error: enable_dec sollte '1' sein" severity error;
        wait for 40 ns;  -- Warten auf den nächsten Zustand
        assert (enable_exe = '1') report "Error: enable_exe sollte '1' sein" severity error;
        wait for 40 ns;  -- Warten auf den nächsten Zustand
        assert (enable_wb = '1') report "Error: enable_wb sollte '1' sein" severity error;

        -- Test 2: Zurück zu fetch nach writeback
        wait for 40 ns;
        assert (enable_fet = '1') report "Error: enable_fet sollte wieder '1' sein" severity error;
        
        -- Test 3: Rücksetzen und Wiederholung
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        wait for 20 ns;

        -- Ende der Testbench
        assert false report "Test abgeschlossen" severity note;
        wait;
    end process;
end behavior;
