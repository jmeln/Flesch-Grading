with Ada.Text_IO;
with Ada.IO_exceptions;
with Ada.Command_Line; --Added
with Ada.Strings.Unbounded; --Added
use Ada.Text_IO;
use Ada.IO_Exceptions;
use Ada.Command_Line; --Added
use Ada.Strings.Unbounded; --Added

procedure flesch is
	
	In_File			:Ada.Text_IO.File_Type;
	value			:Character;
	string_array	:array(1..6000000) of Character;
	pos				:Integer;
	cl				:String(1..8)
					:= Ada.Command_Line.Argument(1);

begin

	Ada.Text_IO.Open(File => In_File, Mode =>Ada.Text_IO.In_File, Name => cl.trim());
	
	pos:=0;
	while not Ada.Text_IO.End_Of_File(In_File)loop
		Ada.Text_IO.Get(File=>In_File,Item=>value);
		pos:=pos+1;
		string_array(pos):=value;
	end loop;

	--We know we are going to hit the end of the file, so handle the exception
	exception
		when Ada.IO_Exceptions.END_ERROR=>Ada.Text_IO.Close(File=>In_File);
	
	--Now put the contents of the entire array on the screen
	for i in 1..pos loop
		Ada.Text_IO.Put(Item=>string_array(i));
	end loop;

	Ada.Text_IO.New_Line;
end flesch;
