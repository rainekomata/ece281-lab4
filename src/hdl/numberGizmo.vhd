--+----------------------------------------------------------------------------
--| 
--| COPYRIGHT 2017 United States Air Force Academy All rights reserved.
--| 
--| United States Air Force Academy     __  _______ ___    _________ 
--| Dept of Electrical &               / / / / ___//   |  / ____/   |
--| Computer Engineering              / / / /\__ \/ /| | / /_  / /| |
--| 2354 Fairchild Drive Ste 2F6     / /_/ /___/ / ___ |/ __/ / ___ |
--| USAF Academy, CO 80840           \____//____/_/  |_/_/   /_/  |_|
--| 
--| ---------------------------------------------------------------------------
--|
--| FILENAME      : clock_divider.vhd
--| AUTHOR(S)     : Capt Phillip Warner, Raine Komata
--| CREATED       : 03/2017
--| DESCRIPTION   : This file implements a generic clock divider that uses a counter and comparator.
--|					This provides more flexibility than simpler designs that use a bit from a 
--|					clk bus (they only provide divisors of powers of 2).
--|  
--| DOCUMENTATION : Collaberated with my lab partner C3C Chapman
--|
--+----------------------------------------------------------------------------
--|
--| REQUIRED FILES :
--|
--|    Libraries : ieee
--|    Packages  : std_logic_1164, numeric_std, unisim
--|    Files     : None
--|
--+----------------------------------------------------------------------------
--|
--| NAMING CONVENSIONS :
--|
--|    b_<port name>            = on-chip bidirectional port
--|    i_<port name>            = on-chip input port
--|    o_<port name>            = on-chip output port
--|    c_<signal name>          = combinatorial signal
--|    f_<signal name>          = synchronous signal
--|    ff_<signal name>         = pipeline stage (ff_, fff_, etc.)
--|    <signal name>_n          = active low signal
--|    w_<signal name>          = top level wiring signal
--|    g_<generic name>         = generic
--|    k_<constant name>        = constant
--|    v_<variable name>        = variable
--|    sm_<state machine type>  = state machine type definition
--|    s_<signal name>          = state name
--|
--+----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity numberGizmo is
	port ( 
	   i_floor : in std_logic_vector (3 downto 0);
	   o_tens  : out std_logic_vector (3 downto 0);
	   o_ones  : out std_logic_vector (3 downto 0)
	);
end numberGizmo;

architecture numberGizmo_arch of numberGizmo is
	
begin
	-- CONCURRENT STATEMENTS ----------------------------
    o_tens <= "0001" when (i_floor > "1001") or (i_floor = "0000") else "0000";
    o_ones <= 
        "0110" when (i_floor = "0000") else
        i_floor when (i_floor = "1010") else
        "0101" when (i_floor = "1111") else
        "0100" when (i_floor = "1110") else
        "0011" when (i_floor = "1101") else
        "0010" when (i_floor = "1100") else
        "0001" when (i_floor = "1011") else
        "0000" when (i_floor = "1010") else
        "0000";
end numberGizmo_arch;