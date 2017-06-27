with Ada.Command_line; use Ada.Command_line;
with Ada.Text_IO; use Ada.Text_IO;
procedure Yes is
begin
    if Argument_Count > 1 then
        while (True) loop
            Put_Line(Argument(1));
        end loop;
    else
        while (True) loop
            Put_Line("y");
        end loop;
    end if;
end Yes;
