with Ada.Text_IO;
use Ada.Text_IO;
procedure adFunc is
function Minimum(A,B: Integer) return Integer is
begin
	if A <= B then
		return A;
	else
		return B;
	end if;
end Minimum;
	int1	:Integer := 4;
	int2	:Integer := 5;
	int3	:Integer := Minimum(int1, int2);
begin 
Put_Line(int3);
end adFunc;
