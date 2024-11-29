----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.11.2024 11:46:20
-- Design Name: 
-- Module Name: CPU - Behavioral
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

entity CPU is
--  Port ( );
end CPU;

architecture Behavioral of CPU is
    component ProgramCounter
    Port (  --clk     : in  STD_LOGIC;      -- Clock signal
        --RESET   : in  STD_LOGIC;      -- Reset signal
        pc_in   : in  STD_LOGIC_VECTOR(15 downto 0); -- Input address
        pc_out  : out STD_LOGIC_VECTOR(15 downto 0)  -- Output to other entities
    );
    end component;
    
    component Decoder
    Port (
        --clk: in std_logic;
        instruction_in: in std_logic_vector (15 downto 0);
        enabler_dec: in std_logic;
        opcode_out: out std_logic_vector (3 downto 0);
        dest_reg: out std_logic_vector (3 downto 0);
        src_reg1: out std_logic_vector(3 downto 0);
        src_reg2: out std_logic_vector(3 downto 0);
        ram_addr: out std_logic_vector (7 downto 0)
    );
    end component;
   
    component RegisterFile
    Port(
      --clk_in            : in STD_LOGIC;                         -- Clock-Signal
      reset_in          : in STD_LOGIC;                         -- Reset-Signal
      write_enable_in   : in STD_LOGIC;                         -- Allow write in reg
      read_enable_in    : in std_logic;                         --Allow read of reg
      result_addr_in    : in STD_LOGIC_VECTOR(3 downto 0);      -- Address for write to register
      --result_data_in    : in STD_LOGIC_VECTOR(15 downto 0);     -- Data for write to register
      A_addr_in         : in STD_LOGIC_VECTOR(3 downto 0);      -- Address for Read-Channel 1
      B_addr_in         : in STD_LOGIC_VECTOR(3 downto 0);      -- Address for Read-Channel 2
      A_data_out        : out STD_LOGIC_VECTOR(15 downto 0);    -- Data for ALU 1
      B_data_out        : out STD_LOGIC_VECTOR(15 downto 0);    -- Data for ALU 2
      ram_data_out      : out STD_LOGIC_VECTOR(15 downto 0)     -- Write data in RAM
    );
    end component;
    
    component ROM
    Port(
        --clk: in std_logic;
        address_in : in std_logic_vector(7 downto 0); -- Adresse
        data_out   : out std_logic_vector(15 downto 0) -- Ausgabedaten
    );
    end component;
    
    component RAM
    Port(
        --CLK_IN          : in std_logic;                     -- Clock Signal
        ENABLE_IN       : in std_logic;                     -- Aktivierung des Moduls
        --RESET_IN        : in std_logic;                     -- Zurücksetzen des Speichers
        WRITE_ENABLE_IN : in std_logic;                     -- Schreiberlaubnis
        ADDRESS_IN      : in std_logic_vector(7 downto 0);  -- Adresse
        --DATA_IN         : in std_logic_vector(15 downto 0); -- Eingabedaten
        DATA_OUT        : out std_logic_vector(15 downto 0) -- Ausgabedaten
    );
    end component;
    
    component ALU
    Port (
        --clk_in                : in STD_LOGIC;                       -- Clock-Signal
        reset_in              : in STD_LOGIC;                       -- Reset-Signal
        A_data_in             : in STD_LOGIC_VECTOR(15 downto 0);   -- Data from reg
        B_data_in             : in STD_LOGIC_VECTOR(15 downto 0);   -- Data from reg
        opcode_in             : in STD_LOGIC_VECTOR(3 downto 0);    -- ALU Operation Code
        result_out            : out STD_LOGIC_VECTOR(15 downto 0);  -- Result of Operation
        zero_flag_out         : out STD_LOGIC;                      -- Flag for 0-Result
        ram_read_enable_out   : out STD_LOGIC;                      -- Flag for RAM to load
        ram_write_enable_out  : out STD_LOGIC;                      -- Flag for RAM to store
        reg_read_enable_out   : out STD_LOGIC;                      -- Flag for RAM to load
        reg_write_enable_out  : out STD_LOGIC  
        );
    end component;
    
    component Control_Unit_STM
    Port(
        clk_in: in std_logic;
        reset_in: in std_logic;
        enable_fet: out std_logic;
        enable_dec: out std_logic;
        enable_exe: out std_logic;
        enable_wb: out std_logic
    );
    end component;
    
    component Control_Unit_PIPE
    Port(
         clk_in: in std_logic;
        reset_in: out std_logic;
    
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
        alu_op: out std_logic_vector(3 downto 0);   --to ALU
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
    end component;
   
    --Signals added here
        signal clk: std_logic := '0';
        --Program Counter
        --signal pc_op : STD_LOGIC_VECTOR (1 downto 0) := (others => '0'); --pc
        signal pc_input : STD_LOGIC_VECTOR (15 downto 0) := (others => '0'); --pc
        signal pc_output : STD_LOGIC_VECTOR (15 downto 0) := (others => '0'); --pc to ROM
        --Regfile
        signal r1_data : STD_LOGIC_VECTOR (15 downto 0) := (others => '0'); --Reg to ALU
        signal r2_data : STD_LOGIC_VECTOR (15 downto 0) := (others => '0'); --Reg to ALU
        signal rD_data : STD_LOGIC_VECTOR (15 downto 0) := (others => '0'); --Reg to ALU
        
        --Decoder
        signal opcode: std_logic_vector (3 downto 0) := (others => '0');    --Decoder to Pipeline and ALU
        signal RAM_addr: std_logic_vector (7 downto 0) := (others => '0');  --Decoder to RAM
        signal r1_addr : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');  --Decoder to Reg
        signal r2_addr : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');  --Decoder to Reg
        signal rD_addr: std_logic_vector (3 downto 0) :=(others =>'0'); --Decoder to Reg
        
        --ROM
        signal instruction: std_logic_vector(15 downto 0) := (others => '0');--ROM to Decoder and PIPE

        --RAM
        signal RAM_data: std_logic_vector(15 downto 0) :=(others => '0'); --RAM to Reg
        --maybe something missing
        
        --ALU
        signal REG_write: std_logic:='0'; --ALU to Reg
        signal REG_read: std_logic := '0';  --ALU-Reg
        signal RAM_enable_write: std_logic :='0';   --ALU to RAM
        signal RAM_enable_read: std_logic :='0';    --ALU to RAM
        signal ALU_result: std_logic_vector (15 downto 0) := (others => '0'); --ALU to REG and (PIPE)
        
        
        --Control Unit State Machine
        signal fet_enable:std_logic :='0';  --STM to fetch and PIPE
        signal dec_enable:std_logic :='0';  --STM to decode and PIPE
        signal exe_enable:std_logic :='0';  --STM to execute and PIPE
        signal wb_enable:std_logic :='0';  --STM to writeback and PIPE
        signal reset: std_logic :='0'; --Program Counter, Reg, Pipeline, ALU, RAM, ROM, Decoder, Control Unit
        

        --Control Unit Pipeline
        signal ALU_op: std_logic_vector(3 downto 0) := (others => '0');        --PIPE to ALU
        signal operator1: std_logic_vector(3 downto 0):= (others => '0');        --PIPE to ALU
        signal operator2: std_logic_vector(3 downto 0):= (others => '0');        --PIPE to ALU
        signal operator_result: std_logic_vector(3 downto 0):= (others => '0');        --PIPE to ALU
        signal result: std_logic_vector (15 downto 0):= (others => '0');
    begin
    
    cpu_program_counter: ProgramCounter PORT MAP(
        pc_in => pc_input,
        pc_out => pc_output
    );
    cpu_registerfile: RegisterFile PORT MAP(
        reset_in => reset,
        write_enable_in=>REG_write,
        read_enable_in => REG_read,
        result_addr_in =>RAM_addr,
        --result_data_in <=,
        A_addr_in => r1_addr,
        B_addr_in => r2_addr,
        A_data_out => r1_data,
        B_data_out => r2_data,
        ram_data_out => RAM_data  
    );

    cpu_decoder: Decoder PORT MAP(
        instruction_in => instruction,
        enabler_dec => dec_enable,
        opcode_out => opcode,
        src_reg1 => r1_addr,
        src_reg2 => r2_addr,
        dest_reg => rD_addr,
        ram_addr => RAM_addr
    );
    cpu_ram: RAM PORT MAP(
        enable_in =>RAM_enable_read,
        write_enable_in => RAM_enable_write,
        address_in => RAM_addr,
        --data_in => RAM_data,
        data_out => RAM_data
    );
    cpu_rom: ROM PORT MAP(
        address_in => pc_output,
        data_out => instruction
    );
    cpu_control_unit_stm: Control_Unit_STM PORT MAP(
        clk_in => clk,
        reset_in => reset, 
        enable_fet => fet_enable,
        enable_dec => dec_enable,
        enable_exe => exe_enable,
        enable_wb => wb_enable
    );
    cpu_control_unit_pipeline: Control_Unit_PIPE PORT MAP(
        clk_in => clk,
        reset_in => reset,
        enable_fet => fet_enable,
        enable_dec => dec_enable,
        enable_exe => exe_enable,
        enable_wb => wb_enable,
        instruction_in => instruction,
        opcode_in => opcode,
        operand_1 => r1_addr,
        operand_2 => r2_addr,
        operand_result => rd_addr,
        op1 => operator1,
        op2 => operator2,
        opr => operator_result,
        alu_op => ALU_op,
        alu_result => ALU_result,
        result_out => result
    );
    
end Behavioral;
