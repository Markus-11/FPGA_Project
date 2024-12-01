library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    Port (
        reset_in              : in STD_LOGIC;                       -- Reset-Signal
        A_data_in             : in STD_LOGIC_VECTOR(15 downto 0);   -- Data from reg
        B_data_in             : in STD_LOGIC_VECTOR(15 downto 0);   -- Data from reg
        opcode_in             : in STD_LOGIC_VECTOR(3 downto 0);    -- ALU Operation Code
        enable_in             : in std_logic ;
        ALU_result_out        : out STD_LOGIC_VECTOR(15 downto 0);  -- Result of Operation
        REG_write_enable_out  : out STD_logic
    );
end ALU;

architecture Behavioral of ALU is
    signal internal_result : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
begin
    process(enable_in)
    begin
        if reset_in = '1' then                                      -- Reset all signals to default values
            internal_result <= (others => '0');
            alu_result_out <= (others => '0');
        end if;
        if rising_edge(enable_in) then                              -- Normal operation on rising clock edge
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
                when others =>
                    internal_result <= (others => '0');
            end case;
            
            -- Write result to Output-Port
            ALU_result_out <= internal_result;
        end if;
        if falling_edge (enable_in) then
            reg_write_enable_out <= '0';
        end if;
    end process;
end Behavioral;