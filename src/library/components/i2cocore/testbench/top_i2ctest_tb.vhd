---------------------------------------------------------------------------
-- Company     : Automaticaly generated by POD
-- Author(s)   : 
-- 
-- Creation Date : 2008-10-20
-- File          : Top_i2ctest_tb.vhd
--
-- Abstract : 
-- insert a description here
--
---------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- 
--                 Defines communication functions between imx and fpga:
--     
--                 write procedures
--                 procedure imx_write
--                 Params :
--                    address      : Write address 
--                    value        : value to write 
--                    gls_clk      : clock signal
--                    imx_cs_n     : Chip select 
--                    imx_oe_n     : Read signal
--                    imx_eb3_n    : Write signal
--                    imx_address  : Address signal
--                    imx_data     : Data signal
--                    WSC          : Value of imx WSC (see MC9328MXLRM.pdf p169) for sync=0
--     
--                 read procedures
--                 procedure imx_read
--                 Params :
--                    address      : Write address 
--                    value        : value returned
--                    gls_clk      : clock signal
--                    imx_cs_n     : Chip select 
--                    imx_oe_n     : Read signal
--                    imx_eb3_n    : Write signal
--                    imx_address  : Address signal
--                    imx_data     : Data signal
--                    WSC          : Value of imx WSC (see MC9328MXLRM.pdf p169) for sync=0
--                 
use work.apf_test_pkg.all;

entity top_i2ctest_tb is
end entity top_i2ctest_tb;

architecture RTL of top_i2ctest_tb is

    CONSTANT HALF_PERIODE : time := 5.20833333333 ns;  -- Half clock period
    CONSTANT IRQ_MNGR00_IRQ_MNGR_MASK : std_logic_vector := x"0000";
    CONSTANT IRQ_MNGR00_IRQ_MNGR_PENDING_ACK : std_logic_vector := x"0002";
    CONSTANT IRQ_MNGR00_ID : std_logic_vector := x"0004";
    CONSTANT I2C_PRESCLO : std_logic_vector := x"0020";
    CONSTANT I2C_PRESCHI : std_logic_vector := x"0022";
    CONSTANT I2C_CTR : std_logic_vector := x"0024";
    CONSTANT I2C_CR : std_logic_vector := x"0028";
    CONSTANT I2C_TXR : std_logic_vector := x"002a";
    CONSTANT I2C_SR : std_logic_vector := x"002c";
    CONSTANT I2C_RXR : std_logic_vector := x"002e";
    CONSTANT I2C_ID : std_logic_vector := x"0030";

    -- Values
    CONSTANT PRELo : std_logic_vector := x"00BF";
    CONSTANT PREHi : std_logic_vector := x"0000";
    
    -- read/write (accelerometer)
    CONSTANT ADDR   : std_logic_vector := x"001D";  -- lis3lv02dl
    CONSTANT SUBADDR : std_logic_vector := x"0016"; -- OFFSET_X
    CONSTANT VALUE	: std_logic_vector := x"00BB";
    
    --/* irq position in irqmngr */
    CONSTANT IRQ  : std_logic_vector := x"0001";
    
    
    --/* CTR register */
    CONSTANT I2C_EN    : std_logic_vector := x"0080";
    CONSTANT I2C_IEN   : std_logic_vector := x"0040";
    
    --/* CR register */
    CONSTANT I2C_STA   : std_logic_vector := x"0080";
    CONSTANT I2C_STO   : std_logic_vector := x"0040";
    CONSTANT I2C_RD    : std_logic_vector := x"0020";
    CONSTANT I2C_WR    : std_logic_vector := x"0010";
    CONSTANT I2C_ACK   : std_logic_vector := x"0008";
    CONSTANT I2C_IACK  : std_logic_vector := x"0001";
    
    --/* read/write bit */
    CONSTANT I2C_ADD_READ  : std_logic := '1';
    CONSTANT I2C_ADD_WRITE : std_logic := '0';




    -- i2c
    signal  i2c_scl :  std_logic;
    signal  i2c_sda :  std_logic;

    -- imx9328
    signal  imx9328_wb16_wrapper00_imx_address :  std_logic_vector(11 downto 0);
    signal  imx9328_wb16_wrapper00_imx_cs_n :  std_logic;
    signal  imx9328_wb16_wrapper00_imx_data :  std_logic_vector(15 downto 0);
    signal  imx9328_wb16_wrapper00_imx_eb3_n :  std_logic;
    signal  imx9328_wb16_wrapper00_imx_oe_n :  std_logic;

    -- irq
    signal  irq_mngr00_gls_irq :  std_logic;

    -- rstgen
    signal  rstgen_syscon00_ext_clk :  std_logic;

    component top_i2ctest
    port (
    -- i2c
        i2c_scl : inout std_logic;
        i2c_sda : inout std_logic;

    -- imx9328
        imx9328_wb16_wrapper00_imx_address : in std_logic_vector(11 downto 0);
        imx9328_wb16_wrapper00_imx_cs_n : in std_logic;
        imx9328_wb16_wrapper00_imx_data : inout std_logic_vector(15 downto 0);
        imx9328_wb16_wrapper00_imx_eb3_n : in std_logic;
        imx9328_wb16_wrapper00_imx_oe_n : in std_logic;

    -- irq
        irq_mngr00_gls_irq : out std_logic;

    -- rstgen
        rstgen_syscon00_ext_clk : in std_logic
    );
    end component top_i2ctest;

begin

    top : top_i2ctest
    port map(
        i2c_scl => i2c_scl,
        i2c_sda => i2c_sda,
        imx9328_wb16_wrapper00_imx_address => imx9328_wb16_wrapper00_imx_address,
        imx9328_wb16_wrapper00_imx_cs_n => imx9328_wb16_wrapper00_imx_cs_n,
        imx9328_wb16_wrapper00_imx_data => imx9328_wb16_wrapper00_imx_data,
        imx9328_wb16_wrapper00_imx_eb3_n => imx9328_wb16_wrapper00_imx_eb3_n,
        imx9328_wb16_wrapper00_imx_oe_n => imx9328_wb16_wrapper00_imx_oe_n,
        irq_mngr00_gls_irq => irq_mngr00_gls_irq,
        rstgen_syscon00_ext_clk => rstgen_syscon00_ext_clk
    );

    pullup_p : process
    begin
        i2c_sda <= 'H';
        i2c_scl <= 'H';
    end process pullup_p;

    stimulis : process
    begin
        imx9328_wb16_wrapper00_imx_address <= (others =>  '0');
        imx9328_wb16_wrapper00_imx_cs_n <= '1';
        imx9328_wb16_wrapper00_imx_data <= (others =>  'Z');
        imx9328_wb16_wrapper00_imx_eb3_n <= '1';
        imx9328_wb16_wrapper00_imx_oe_n <= '1';

        -- unmask interrupt for i2c in interrupt manager  
        imx_write(IRQ_MNGR00_IRQ_MNGR_MASK,IRQ,
        rstgen_syscon00_ext_clk,imx9328_wb16_wrapper00_imx_cs_n,
        imx9328_wb16_wrapper00_imx_oe_n,imx9328_wb16_wrapper00_imx_eb3_n,
        imx9328_wb16_wrapper00_imx_address,imx9328_wb16_wrapper00_imx_data,
        4);

	    --/* set prescale */
        imx_write(I2C_PRESCLO,PRELo,
        rstgen_syscon00_ext_clk,imx9328_wb16_wrapper00_imx_cs_n,
        imx9328_wb16_wrapper00_imx_oe_n,imx9328_wb16_wrapper00_imx_eb3_n,
        imx9328_wb16_wrapper00_imx_address,imx9328_wb16_wrapper00_imx_data,
        4);
        imx_write(I2C_PRESCHI,PREHi,
        rstgen_syscon00_ext_clk,imx9328_wb16_wrapper00_imx_cs_n,
        imx9328_wb16_wrapper00_imx_oe_n,imx9328_wb16_wrapper00_imx_eb3_n,
        imx9328_wb16_wrapper00_imx_address,imx9328_wb16_wrapper00_imx_data,
        4);
        
	    --/* set core enable and interrupt enable*/
        imx_write(I2C_CTR,(I2C_EN or I2C_IEN),
        rstgen_syscon00_ext_clk,imx9328_wb16_wrapper00_imx_cs_n,
        imx9328_wb16_wrapper00_imx_oe_n,imx9328_wb16_wrapper00_imx_eb3_n,
        imx9328_wb16_wrapper00_imx_address,imx9328_wb16_wrapper00_imx_data,
        4);

	    --/* write slave adresse on TXR */
        imx_write(I2C_TXR,ADDR(14 downto 0)&I2C_ADD_READ,
        rstgen_syscon00_ext_clk,imx9328_wb16_wrapper00_imx_cs_n,
        imx9328_wb16_wrapper00_imx_oe_n,imx9328_wb16_wrapper00_imx_eb3_n,
        imx9328_wb16_wrapper00_imx_address,imx9328_wb16_wrapper00_imx_data,
        4);

	    --/* and CTR register*/
        imx_write(I2C_CTR,(I2C_STA or I2C_WR or I2C_IACK),
        rstgen_syscon00_ext_clk,imx9328_wb16_wrapper00_imx_cs_n,
        imx9328_wb16_wrapper00_imx_oe_n,imx9328_wb16_wrapper00_imx_eb3_n,
        imx9328_wb16_wrapper00_imx_address,imx9328_wb16_wrapper00_imx_data,
        4);

        wait for 10 us;
        assert false report "End of test" severity error;
    end process stimulis;
    
    clockp : process
    begin
        rstgen_syscon00_ext_clk <= '1';
        wait for HALF_PERIODE;
        rstgen_syscon00_ext_clk <= '0';
        wait for HALF_PERIODE;
    end process clockp;

end architecture RTL;
