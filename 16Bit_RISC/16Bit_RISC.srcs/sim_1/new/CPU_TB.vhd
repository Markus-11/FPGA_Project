library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CPU is
--  Port ( );
end CPU;

architecture Behavioral of CPU is
    component ProgramCounter
    Port (  --clk_in    : in  STD_LOGIC;      -- Clock signal
        RESET_in   : in  STD_LOGIC;      -- Reset signal
        enable_in : in std_logic ;
        pc_out  : out STD_LOGIC_VECTOR(7 downto 0);  -- Output to other entities
        ROM_enable_m_out: out std_logic
    );
    end component;
    
    component ROM
    Port(
        enable_in : in std_logic;
        address_in : in std_logic_vector(7 downto 0); -- Adresse
        instruction_out   : out std_logic_vector(15 downto 0); -- Ausgabedaten
        ROM_buffer_enable_out: out std_logic
    );
    end component;
    component Decoder
    Port (
        reset_in: in std_logic;
        instruction_in: in std_logic_vector (15 downto 0);
        enable_in: in std_logic;
        opcode_out: out std_logic_vector (3 downto 0);
        dest_reg_out: out std_logic_vector (3 downto 0);
        src_reg1_out: out std_logic_vector(3 downto 0);
        src_reg2_out: out std_logic_vector(3 downto 0);
        ram_addr_out: out std_logic_vector (7 downto 0);
        DEC_buffer_enable_out: out std_logic
    );
    end component;
   
    component RegisterFile
    Port(
      reset_in          : in STD_LOGIC;                         -- Reset-Signal
      enable_in         : in std_logic;
      RAM_enable_s_out  : out std_logic;
      REG_enable_l_in   : in std_logic ;
      REG_enable_s_in   : in std_logic ;
      REG_enable_wb_in  : in std_logic;
      result_addr_in    : in STD_LOGIC_VECTOR(3 downto 0);      -- Address for write to register
      result_data_in    : in STD_LOGIC_VECTOR(15 downto 0);     -- Data for write to register
      A_addr_in         : in STD_LOGIC_VECTOR(3 downto 0);      -- Address for Read-Channel 1
      B_addr_in         : in STD_LOGIC_VECTOR(3 downto 0);      -- Address for Read-Channel 2
      data_from_RAM_in  : in std_logic_vector (15 downto 0);  -- Data from Ram
      A_data_out        : out STD_LOGIC_VECTOR(15 downto 0);    -- Data for ALU 1
      B_data_out        : out STD_LOGIC_VECTOR(15 downto 0);    -- Data for ALU 2
      ram_data_out      : out STD_LOGIC_VECTOR(15 downto 0);     -- Write data in RAM
      enable_ALU_m_out  : out std_logic
    );
    end component;
      
    component RAM
    Port(
        RAM_enable_s_in      : in std_logic;                     -- Aktivierung des Moduls
        RAM_enable_l_in    : in std_logic ;
        REG_enable_l_out    : out std_logic ;
        RESET_IN        : in std_logic;                     -- Zurücksetzen des Speichers
        ADDRESS_IN      : in std_logic_vector(7 downto 0);  -- Adresse
        DATA_IN         : in std_logic_vector(15 downto 0); -- Eingabedaten
        DATA_OUT        : out std_logic_vector(15 downto 0) -- Ausgabedaten

    );
    end component;
    
    component ALU
    Port (
        reset_in              : in STD_LOGIC;                       -- Reset-Signal
        enable_in             : in std_logic;
        A_data_in             : in STD_LOGIC_VECTOR(15 downto 0);   -- Data from reg
        B_data_in             : in STD_LOGIC_VECTOR(15 downto 0);   -- Data from reg
        opcode_in             : in STD_LOGIC_VECTOR(3 downto 0);    -- ALU Operation Code
        alu_result_out        : out STD_LOGIC_VECTOR(15 downto 0);  -- Result of Operation
        REG_write_enable_out  : out std_logic

        );
    end component;
    
    component Control_Unit_STM
    Port(
        clk_in: in std_logic;
        reset_out: out std_logic;
        enable_fet: out std_logic;
        enable_dec: out std_logic;
        enable_exe: out std_logic;
        enable_wb: out std_logic
    );
    end component;
    
    component Control_Unit_PIPE
    Port(
        clk_in: in std_logic;
        reset_out: out std_logic;
    
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
        opcode_out: out std_logic_vector (3 downto 0);
        operand_1_addr_out: out std_logic_vector (3 downto 0);     --to ALU
        operand_2_addr_out: out std_logic_vector (3 downto 0);     --to ALU
        operand_result_addr_out: out std_logic_vector (3 downto 0);   --Decoder
        instruction_output: out std_logic_vector (15 downto 0);    
        ram_addr_out : out std_logic_vector (7 downto 0);
        ALU_result_in: in std_logic_vector (15 downto 0);
        ALU_result_out : out std_logic_vector (15 downto 0);
        
        --writeback
        enable_wb_in: in std_logic;    --
        
        enable_DEC_m_out: out std_logic;
        enable_REG_m_out: out std_logic;
        REG_enable_wb_out: out std_logic;
        enable_RAM_l_out: out std_logic;
        enable_REG_s_out: out std_logic;
        enable_PC_m_out: out std_logic;   
        ALU_buffer_enable_in: in std_logic;
        ROM_buffer_enable_in: in std_logic;
        DEC_buffer_enable_in: in std_logic
        );
    end component;
   
    --Signals added here
        signal clk: std_logic := '0';
        constant clk_period: time :=1000 ns;
        --Program Counter
        signal PC_enable: std_logic := '0';
        signal pc_output : STD_LOGIC_VECTOR (7 downto 0) := (others => '0'); --pc
        --Regfile
        signal REG_enable: std_logic :='0';
        signal REG_enable_l: std_logic:= '0';
        signal REG_enable_s: std_logic := '0';
        signal r1_data : STD_LOGIC_VECTOR (15 downto 0) := (others => '0'); --Reg to ALU
        signal r2_data : STD_LOGIC_VECTOR (15 downto 0) := (others => '0'); --Reg to ALU
        signal data_to_RAM: std_logic_vector(15 downto 0) :=(others => '0'); --Reg to RAM
        

        --Decoder
        signal PIPE_opcode_in: std_logic_vector (3 downto 0) := (others => '0');    --Decoder to Pipeline
        signal PIPE_RAM_addr_in: std_logic_vector (7 downto 0) := (others => '0');  --Decoder to Pipeline
        signal PIPE_r1_addr_in : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');  --Decoder to PIPE
        signal PIPE_r2_addr_in : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');  --Decoder to PIPE
        signal PIPE_rD_addr_in: std_logic_vector (3 downto 0) :=(others =>'0'); --Decoder to PIPE
        --ROM
        signal ROM_enable : std_logic := '0';
        signal PIPE_instruction_in: std_logic_vector(15 downto 0) := (others => '0');--ROM to Decoder and PIPE
        --RAM
        signal RAM_enable_l: std_logic :='0';
        signal RAM_enable_s: std_logic :='0';
        signal data_to_REG: std_logic_vector (15 downto 0) := (others => '0'); --RAM to REG
        --maybe something missing
        --ALU
        signal ALU_enable: std_logic  := '0';
        signal ALU_result: std_logic_vector (15 downto 0) := (others => '0'); --ALU to REG and (PIPE)
        signal ALU_buffer_enable: std_logic := '0';
        --Control Unit State Machine
        signal fet_enable:std_logic :='0';  --STM to fetch and PIPE
        signal dec_enable:std_logic :='0';  --STM to decode and PIPE
        signal exe_enable:std_logic :='0';  --STM to execute and PIPE
        signal wb_enable:std_logic :='0';  --STM to writeback and PIPE
        signal reset: std_logic :='0'; --Program Counter, Reg, Pipeline, ALU, RAM, ROM, Decoder, Control Unit
        --Control Unit Pipeline
        signal PIPE_r1_addr_out: std_logic_vector(3 downto 0):= (others => '0');        --PIPE to ALU
        signal PIPE_r2_addr_out: std_logic_vector(3 downto 0):= (others => '0');        --PIPE to ALU
        signal PIPE_rd_addr_out: std_logic_vector(3 downto 0):= (others => '0');        --PIPE to ALU
        signal PIPE_instruction_out: std_logic_vector (15 downto 0) := (others => '0');
        signal PIPE_opcode_out: std_logic_vector (3 downto 0) := (others => '0');
        signal PIPE_RAM_addr_out: std_logic_vector (7 downto 0) := (others => '0');  --Pipeline to RAM
        signal PIPE_REG_enable_wb_out: std_logic :='0';
        signal PIPE_ALU_result_in : std_logic_vector (15 downto 0):=(others => '0');
        signal PIPE_ALU_result_out : std_logic_vector (15 downto 0):= (others => '0');
  
        signal ROM_buffer_enable: std_logic := '0';
        signal DEC_buffer_enable: std_logic := '0';
        
    begin
    cpu_program_counter: ProgramCounter PORT MAP(
        reset_in => reset,
        enable_in => PC_enable,
        pc_out => pc_output,       
        ROM_enable_m_out => ROM_enable  
    );
    cpu_registerfile: RegisterFile PORT MAP(
        reset_in => reset,
        enable_in => REG_enable,
        RAM_enable_s_out => RAM_enable_s,
        REG_enable_l_in => REG_enable_l,
        REG_enable_s_in => REG_enable_s,
        REG_enable_wb_in => PIPE_REG_enable_wb_out,
        result_addr_in =>PIPE_rd_addr_out,
        result_data_in => PIPE_alu_result_out,
        A_addr_in => PIPE_r1_addr_out,
        B_addr_in => PIPE_r2_addr_out,
        A_data_out => r1_data,
        B_data_out => r2_data,
        ram_data_out => data_to_RAM,
        data_from_RAM_in => DATA_to_REG,
        enable_ALU_m_out => ALU_Enable
    );

    cpu_decoder: Decoder PORT MAP(
        reset_in => reset,
        instruction_in => PIPE_instruction_out,
        enable_in => dec_enable,
        opcode_out => PIPE_opcode_in,
        src_reg1_out => PIPE_r1_addr_in,
        src_reg2_out => PIPE_r2_addr_in,
        dest_reg_out => PIPE_rD_addr_in,
        ram_addr_out => PIPE_RAM_addr_in,
        DEC_buffer_enable_out => DEC_buffer_enable
    );
    
    cpu_alu : ALU PORT MAP (
        reset_in => reset,
        enable_in => ALU_enable,
        A_data_in => r1_data,
        B_data_in => r2_data,
        opcode_in => PIPE_opcode_out,
        alu_result_out => PIPE_ALU_result_in,
        REG_write_enable_out => ALU_buffer_enable     
    );
    cpu_ram: RAM 
    PORT MAP(
        RAM_enable_l_in =>RAM_enable_l,
        RAM_enable_s_in => RAM_enable_s,        
        REG_enable_l_out =>REG_enable_l,
        reset_in => reset,
        address_in => PIPE_RAM_addr_out,
        data_in => data_to_RAM,
        data_out => data_to_REG
    );
    cpu_rom: ROM 
    PORT MAP(
        enable_in => ROM_enable,
        address_in => pc_output,
        instruction_out => PIPE_instruction_in,
        ROM_buffer_enable_out => ROM_buffer_enable
    );
    cpu_control_unit_stm: Control_Unit_STM PORT MAP(
        clk_in => clk,
        reset_out=> reset,
        enable_fet => fet_enable,
        enable_dec => dec_enable,
        enable_exe => exe_enable,
        enable_wb => wb_enable

    );
    cpu_control_unit_pipeline: Control_Unit_PIPE PORT MAP(
        clk_in => clk,
        reset_out => reset,
        enable_fet_in => fet_enable,
        enable_dec_in => dec_enable,
        enable_exe_in => exe_enable,
        enable_wb_in => wb_enable,
        enable_DEC_m_out => DEC_enable,
        enable_REG_m_out => REG_enable,
        enable_REG_s_out => REG_enable_s,
        REG_enable_wb_out => PIPE_REG_enable_wb_out,
        enable_RAM_l_out => RAM_enable_l,
        enable_PC_m_out => PC_enable,
        instruction_in => PIPE_instruction_in,
        instruction_output => PIPE_instruction_out,
        opcode_in => PIPE_opcode_in,
        operand_1_addr_in => PIPE_r1_addr_in,
        operand_2_addr_in => PIPE_r2_addr_in,
        operand_result_addr_in => PIPE_rd_addr_in,
        opcode_out => PIPE_opcode_out,
        operand_1_addr_out => PIPE_r1_addr_out,
        operand_2_addr_out => PIPE_r2_addr_out,
        operand_result_addr_out => PIPE_rd_addr_out,
        ram_addr_in => PIPE_RAM_addr_in,
        ram_addr_out => PIPE_RAM_addr_out,
        ALU_result_in =>PIPE_ALU_result_in,
        ALU_result_out => PIPE_ALU_result_out,          
        ALU_buffer_enable_in => ALU_Buffer_enable,
        ROM_buffer_enable_in => ROM_buffer_enable,
        DEC_buffer_enable_in => DEC_buffer_enable
    );

    clk_process : process
    begin
         clk<= '0';
         wait for clk_period/2;
         clk <= '1';
         wait for clk_period/2;
    end process;
    
    cpu_process: process
    begin 
        reset <= '1'; -- reset control unit and pc
        wait for clk_period; -- wait
        reset <= '0';
    end process;
end Behavioral;