library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    Port (
        clk_in                : in STD_LOGIC;                       -- Clock-Signal
        reset_in              : in STD_LOGIC;                       -- Reset-Signal
        A_data_in             : in STD_LOGIC_VECTOR(15 downto 0);   -- Data from reg
        B_data_in             : in STD_LOGIC_VECTOR(15 downto 0);   -- Data from reg
        opcode_in             : in STD_LOGIC_VECTOR(3 downto 0);    -- ALU Operation Code
        result_out            : out STD_LOGIC_VECTOR(15 downto 0);  -- Result of Operation
        zero_flag_out         : out STD_LOGIC;                      -- Flag for 0-Result
        ram_read_enable_out   : out STD_LOGIC;                      -- Flag for RAM to load
        ram_write_enable_out  : out STD_LOGIC;                      -- Flag for RAM to store
        reg_read_enable_out   : out STD_LOGIC;                      -- Flag for RAM to load
        reg_write_enable_out  : out STD_LOGIC                       -- Flag for RAM to store
    );
end ALU;

architecture Behavioral of ALU is
    signal internal_result : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
begin
    process(clk_in)
    begin
        if reset_in = '1' then                                      -- Reset all signals to default values
            internal_result <= (others => '0');
            result_out <= (others => '0');
            zero_flag_out <= '0';
        elsif rising_edge(clk_in) then                              -- Normal operation on rising clock edge
            ram_write_enable_out <= '1';
            ram_read_enable_out <= '1';
            reg_read_enable_out <= '1';
            reg_write_enable_out <= '1';
            case opcode_in is
                when "0000" => -- Addition
                    internal_result <= std_logic_vector(unsigned(A_data_in) + unsigned(B_data_in));
                    reg_write_enable_out <= '1';
                when "0001" => -- Subtraction
                    internal_result <= std_logic_vector(unsigned(A_data_in) - unsigned(B_data_in));
                    reg_write_enable_out <= '1';
                when "0010" => -- AND
                    internal_result <= A_data_in and B_data_in;
                    reg_write_enable_out <= '1';
                when "0011" => -- OR
                    internal_result <= A_data_in or B_data_in;
                    reg_write_enable_out <= '1';
                when "0100" => -- XOR
                    internal_result <= A_data_in xor B_data_in;
                    reg_write_enable_out <= '1';
                when "0101" => -- NOT
                    internal_result <= not A_data_in;
                    reg_write_enable_out <= '1';
                when "0110" => -- Left-Shift
                    internal_result <= std_logic_vector(unsigned(A_data_in) sll 1);
                    reg_write_enable_out <= '1';
                when "0111" => -- Right-Shift
                    internal_result <= std_logic_vector(unsigned(A_data_in) srl 1);
                    reg_write_enable_out <= '1';
                when "1000" => -- Increment (A + 1)
                    internal_result <= std_logic_vector(unsigned(A_data_in) + 1);
                    reg_write_enable_out <= '1';
                when "1001" => -- Decrement (A - 1)
                    internal_result <= std_logic_vector(unsigned(A_data_in) - 1);
                    reg_write_enable_out <= '1';
                when "1010" => -- Equal (Comparison)
                    if A_data_in = B_data_in then
                        internal_result <= (others => '0');
                    else
                        internal_result <= (others => '1');
                    end if;
                    reg_write_enable_out <= '1';
                when "1011" => -- Greater-than
                    if unsigned(A_data_in) > unsigned(B_data_in) then
                        internal_result <= (others => '1');
                    else
                        internal_result <= (others => '0');
                    end if;
                    reg_write_enable_out <= '1';
                when "1100" => -- Load from RAM to reg
                    ram_read_enable_out <= '1';
                    reg_write_enable_out <= '1';
                when "1101" => -- Store from reg to RAM
                    ram_write_enable_out <= '1';
                    reg_read_enable_out <= '1';
                when others =>
                    internal_result <= (others => '0');
            end case;
            
            -- Set zero_flag, if result is 0
            if unsigned(internal_result) = 0 then
                zero_flag_out <= '1';
            else
                zero_flag_out <= '0';
            end if;

            -- Write result to Output-Port
            result_out <= internal_result;
        end if;
    end process;
end Behavioral;