----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.11.2024 11:23:32
-- Design Name: 
-- Module Name: Control_Unit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Control_Unit_STM is
    Port(
    clk_in: in std_logic;
    reset_in: in std_logic;
    
    enable_fet: out std_logic;
    enable_dec: out std_logic;
    enable_exe: out std_logic;
    enable_wb: out std_logic
    );
    
end Control_Unit_STM;

architecture Behavioral of Control_Unit_STM is
 type state_type is (fetch, decode, execute, writeback);
    signal state, next_state: state_type;
begin
    RST_FSM : process(clk_in)
    begin
        if rising_edge(clk_in) then
            if (reset_in='1') then
                state<=fetch;
            else
                state<=next_state;
            end if;
        end if;
    end process;
    
    process(state)
    begin
    
        case (state) is
            when fetch=>
                enable_fet <= '1';
                next_state<=decode;
            when decode=>
                enable_dec <='1';
                next_state<=execute;
            when execute=>
                enable_exe <= '1';
                next_state<=writeback;
            when writeback=>
                enable_wb <= '1';
                next_state<=fetch; 
        end case;
    end process;

end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Control_Unit_PIPE is
    Port(
    --basic I/O
    clk_in: in std_logic;
    reset: out std_logic;

    --fetch
    enable_fet: in std_logic; --Control Unit
    instruction_in: in std_logic_vector (15 downto 0);  --ROM 
    --decode 
    enable_dec: in std_logic;   --Control Unit
    opcode_in: in std_logic_vector (3 downto 0);    --Decoder
    operand_1: in std_logic_vector (3 downto 0);    --Decoder
    operand_2: in std_logic_vector (3 downto 0);    --Decoder
    operand_result: in std_logic_vector (3 downto 0);   --Decoder
    --execute
    enable_exe: in std_logic;   --Control Unit
    --alu_op: out std_logic_vector(3 downto 0);   --to ALU
    op1: out std_logic_vector (3 downto 0);     --to ALU
    op2: out std_logic_vector (3 downto 0);     --to ALU
    opr: out std_logic_vector (3 downto 0);     --to ALU
    alu_result: in std_logic_vector (3 downto 0);   --ALU
    instruction_out: out std_logic_vector (15 downto 0);    
    --writeback
    enable_wb: in std_logic;    --
    result_out: out std_logic_vector (3 downto 0);
    
    write_enable: out std_logic
    );
end Control_Unit_PIPE;

architecture Behavioral of Control_Unit_PIPE is
--buffer fetch
    signal fetch_reg: std_logic_vector (15 downto 0) :=(others => '0');
--buffer decode
    signal opcode_buf: std_logic_vector (3 downto 0) :=(others => '0');
    signal op_buf1: std_logic_vector (3 downto 0) :=(others => '0');
    signal op_buf2: std_logic_vector (3 downto 0) :=(others => '0');
    signal op_buf3: std_logic_vector (3 downto 0) :=(others => '0');
    signal decode_reg: std_logic_vector (15 downto 0) :=(others => '0');
--buffer execute
    signal execute_reg: std_logic_vector (3 downto 0) :=(others => '0');
--buffer writeback
    signal writeback_reg: std_logic_vector (3 downto 0) :=(others => '0');
    
begin
    FETCH: process(clk_in)
    begin 
        if(enable_fet='1') then
        fetch_reg<= instruction_in;
        end if;
    end process;  
    
    DECODE: process (clk_in)
    begin 
        if(enable_dec='1') then
        decode_reg<=fetch_reg;
        instruction_out<=decode_reg;
        
        opcode_buf<=opcode_in;
        op_buf1<=operand_1;
        op_buf2<=operand_2;
        op_buf3<=operand_result;
        end if;
    end process;
    
    EXECUTE:process(clk_in)
    begin
        if (enable_exe='1') then
        --alu_op<=opcode_buf;
        op1<=op_buf1;
        op2<=op_buf2;
        opr<=op_buf3;
        
        execute_reg<=alu_result;
        end if;
    end process;
    
    WRITE_BACK: process(clk_in)
    begin
         if (enable_wb='1') then
         writeback_reg<=execute_reg;
         end if;
    end process;
    
    result_out<=writeback_reg;
end Behavioral;