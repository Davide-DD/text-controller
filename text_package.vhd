library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

package text_package is
	
	-- put all your strings here
	constant TEXT_1   : string := "";
	constant TEXT_2   : string := "";

	-- here is the message type definition: it has to contain all the labels of the strings you defined before 
	type message is (TEXT_1, TEXT_2);
	
	-- here is the codes type definition: don't worry about it, you can leave this as it is
	type codes is array(natural range<>) of integer;

end package;
