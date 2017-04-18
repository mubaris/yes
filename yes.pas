program Yes;

var
    i : String;

begin
    i := ParamStr(1);
    if (i = '') then i := 'y';
    while(true)
        do
            WriteLn(i);
end.
