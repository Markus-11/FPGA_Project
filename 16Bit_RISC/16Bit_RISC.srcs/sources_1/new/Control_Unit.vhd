library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Control_Unit_STM is
    Port(
    clk_in: in std_logic;
    reset_out: out std_logic;
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
            --if (reset_out='1') then
                --state<=fetch;
            --else
                state<=next_state;
            --end if;
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
    reset_out: out std_logic;
    --pipeline needs reset--------------------------------------------------------------------------------------------------
    
    --fetch
    enable_fet_in: in std_logic; --Control Unit
    instruction_in: in std_logic_vector (15 downto 0);  --ROM 
    --decode 
    enable_dec_in: in std_logic;   --Control Unit
    opcode_in: in std_logic_vector (3 downto 0);    --Decoder
    operand_1_addr_in: in std_logic_vector (3 downto 0);    --Decoder
    operand_2_addr_in: in std_logic_vector (3 downto 0);    --Decoder
    operand_result_addr_in: in std_logic_vector (3 downto 0);   --Decoder
    ram_addr_in : in std_logic_vector (7 downto 0);
    --execute
    enable_exe_in: in std_logic;   --Control Unit
    opcode_out: out std_logic_vector(3 downto 0);   --to ALU
    operand_1_addr_out: out std_logic_vector (3 downto 0);     --to ALU
    operand_2_addr_out: out std_logic_vector (3 downto 0);     --to ALU
    operand_result_addr_out: out std_logic_vector (3 downto 0);     --to ALU
    instruction_output: out std_logic_vector (15 downto 0);
    ram_addr_out : out std_logic_vector (7 downto 0);    
    ALU_result_in: in std_logic_vector (15 downto 0);
    ALU_result_out : out std_logic_vector (15 downto 0);
    --writeback
    enable_wb_in: in std_logic;    --
    enable_DEC_m_out: out std_logic;
    enable_REG_m_out: out std_logic;
    enable_REG_s_out: out std_logic;
    REG_enable_wb_out: out std_logic;
    enable_RAM_l_out: out std_logic;
    enable_PC_m_out: out std_logic;
   
    --Buffer enabler
    ROM_buffer_enable_in: in std_logic;
    DEC_buffer_enable_in: in std_logic;
    ALU_buffer_enable_in: in std_logic
    );
end Control_Unit_PIPE;

architecture Behavioral of Control_Unit_PIPE is

--buffer decode
    signal opcode_buf_1: std_logic_vector (3 downto 0) :=(others => '0');
    signal op_buf1_1: std_logic_vector (3 downto 0) :=(others => '0');
    signal op_buf2_1: std_logic_vector (3 downto 0) :=(others => '0');
    signal op_buf3_1: std_logic_vector (3 downto 0) :=(others => '0');
    signal ram_addr_buf_1: std_logic_vector (7 downto 0) := (others => '0');
    
 --buffer fetch
    signal fetch_reg_1: std_logic_vector (15 downto 0) :=(others => '0');
--buffer decode
    signal decode_reg_1: std_logic_vector (15 downto 0) :=(others => '0');
--buffer execute
    signal execute_reg_1: std_logic_vector (15 downto 0) :=(others => '0');
--buffer writeback
    signal writeback_reg_1: std_logic_vector (15 downto 0) :=(others => '0');

--Douples
--buffer fetch
    signal fetch_reg_2: std_logic_vector (15 downto 0) :=(others => '1');
--buffer decode
    signal decode_reg_2: std_logic_vector (15 downto 0) :=(others => '1');
--buffer execute
    signal execute_reg_2: std_logic_vector (15 downto 0) :=(others => '1');
--buffer writeback
    signal writeback_reg_2: std_logic_vector (15 downto 0) :=(others => '1');
    
    signal opcode_buf_2: std_logic_vector (3 downto 0) :=(others => '1');
    signal op_buf1_2: std_logic_vector (3 downto 0) :=(others => '1');
    signal op_buf2_2: std_logic_vector (3 downto 0) :=(others => '1');
    signal op_buf3_2: std_logic_vector (3 downto 0) :=(others => '1');
    signal ram_addr_buf_2: std_logic_vector (7 downto 0) := (others => '1');


    signal alu_op_condition: std_logic_vector (3 downto 0) := (others => '0');
    signal toggle1: std_logic := '0';
    signal toggle2: std_logic := '0';
    signal toggle3: std_logic := '0';
    signal toggle4: std_logic := '0';
    
begin
    --FETCH PROCESSES
    PROGRAM_COUNTER: process(clk_in)
    begin 
        if rising_edge (clk_in) then
            if(enable_fet_in='1') then
                enable_PC_m_out <='1';
            end if;
        end if;
        if falling_edge (clk_in) then
            enable_PC_m_out<='0';
        end if;
    end process;  
    
    ROM_buffer : process (ROM_buffer_enable_in)
    begin
        if rising_edge(ROM_buffer_enable_in) then
            --Bufferspeicherung
            if(toggle1='0') then
                fetch_reg_1<= instruction_in;
            elsif (toggle1='1') then
                fetch_reg_2<= instruction_in;
            end if;
            enable_PC_m_out<= '0';
            toggle1<= not toggle1;
        end if;
    end process;
    --DECODE PROCESSES
    DECODE: process (clk_in)
    begin 
        if rising_edge (clk_in) then
            if(enable_dec_in='1') then
                if (toggle2= '1') then
                    decode_reg_1<=fetch_reg_1;
                    instruction_output<=decode_reg_1;
                    enable_DEC_m_out <='1';
                elsif(toggle2= '0')then
                    decode_reg_2<=fetch_reg_2;
                    instruction_output<=decode_reg_2;
                    enable_DEC_m_out <='1';
                end if;
            end if;
        end if;
        if falling_edge (clk_in) then
            enable_DEC_m_out <='0';
        end if;
    end process;
    
    DECODE_BUFFER: process (DEC_buffer_enable_in)
    begin
        if rising_edge (DEC_buffer_enable_in) then
            if (toggle2='1') then
                opcode_buf_1<=opcode_in;
                op_buf1_1<=operand_1_addr_in;
                op_buf2_1<=operand_2_addr_in;
                op_buf3_1<=operand_result_addr_in;
                ram_addr_buf_1<=ram_addr_in; 
            elsif (toggle2='0') then
                opcode_buf_2<=opcode_in;
                op_buf1_2<=operand_1_addr_in;
                op_buf2_2<=operand_2_addr_in;
                op_buf3_2<=operand_result_addr_in;
                ram_addr_buf_2<=ram_addr_in; 
            end if;
            toggle2 <= not toggle2;
        end if;
        toggle2<= not toggle2;
    end process;
    
--EXECUTE PROCESSES    
    EXECUTE:process(clk_in)
    begin
        if rising_edge (clk_in) then
            if (enable_exe_in='1') then
                if(toggle2='0') then
                    alu_op_condition <=opcode_buf_2;
                elsif (toggle2='1') then
                    alu_op_condition <= opcode_buf_1;
                end if;
                if alu_op_condition="1100" then --LOAD
                    enable_RAM_l_out<='1';
                elsif alu_op_condition="1101" then  --STORE
                    enable_REG_s_out<='1';
                else 
                    enable_REG_m_out <= '1';
                end if;
            enable_REG_m_out<= '1';
            end if;
        end if;
        if falling_edge (clk_in) then
            enable_RAM_l_out <='0';
        end if;
    end process;
   
    EXECUTE_BUFFER: process (ALU_buffer_enable_in)
    begin
        if rising_edge (ALU_buffer_enable_in) then
            if (toggle3='1') then
                execute_reg_2<=ALU_result_in; 
                opcode_out<=opcode_buf_2;
                operand_1_addr_out<=op_buf1_2;
                operand_2_addr_out<=op_buf2_2;
                operand_result_addr_out<=op_buf3_2;
                ram_addr_out <= ram_addr_buf_2;
            elsif (toggle3='0') then
                execute_reg_1<=ALU_result_in; 
                opcode_out<=opcode_buf_1;
                operand_1_addr_out<=op_buf1_1;
                operand_2_addr_out<=op_buf2_1;
                operand_result_addr_out<=op_buf3_1;
                ram_addr_out <= ram_addr_buf_1;
            end if;
            
            toggle3<= not toggle3;
        end if;
    end process;
    
--WRITEBACK PROCESS    
    WRITE_BACK: process(clk_in)
    begin
        if rising_edge (clk_in) then
             if (enable_wb_in='1') then
                 if(toggle4='0') then 
                    writeback_reg_2<=execute_reg_2;
                    alu_result_out<=writeback_reg_2;
                 elsif(toggle4='1') then
                    writeback_reg_1<=execute_reg_1;
                    alu_result_out<=writeback_reg_1;
                 end if;
                 REG_enable_wb_out<='1';
             end if;
        end if;
    end process;
end Behavioral;