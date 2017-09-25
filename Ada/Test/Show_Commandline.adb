with Ada.Text_IO;
with Ada.Command_Line;
with Ada.Strings.Unbounded;

procedure Show_Commandline is
package T_IO renames Ada.Text_IO;
package CL renames Ada.Command_Line;
package SU renames Ada.Strings.Unbounded;

x: SU.Unbounded_String
 := SU.To_Unbounded_String (CL.Argument(1));

begin
	T_IO.Put("Argument 1 = ");
	T_IO.Put_Line(SU.To_String(x));

	T_IO.Put_Line(SU.To_String(x));
end Show_CommandLine;
