-------------------------------------------------------------------------------
--Hello World Program
-------------------------------------------------------------------------------
with Ada.Text_Io;
use Ada.Text_Io;

procedure hello is
s: String(1 .. 11);

function Count_Letters(Item : String) return Natural is
	count : natural := 0;
begin
	for I in Item'Range loop
		if String.element(I) = 'e' then
			count := count +1;
		end if;
	end loop;
	return count;
end Count_Letters;
begin
	s := "Hello There";
	Put_Line(s(1..5));
	--for i in 0 .. 10 loop
	--	Put_Line("Line " & Integer'Image(i));
	--	if i > 6 then
	--		Put_Line("OVER 6!");
	--	else
	--		Put_Line("UNDER 6!");
	--	end if;
	--end loop;
--end Hello;

end Hello;
