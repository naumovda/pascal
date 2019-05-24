
var
 f_in, f_out: Text;
 i, n: integer; 
 s1, s2: string;
begin
 n := 5;
 
 i := 0;
 
 assign(f_in, 'listtst.txt');
 reset(f_in);
 assign(f_out, 'listtst.~xt');
 rewrite(f_out);
 
 while not eof(f_in) do
 begin
   i := i + 1;
   readln(f_in, s1);   
   if eof(f_in) then break;
   readln(f_in, s2);
   
   if i <> n then
   begin
     writeln(f_out, s1);   
     writeln(f_out, s2);    
   end;   
 end;
 
 close(f_in);
 close(f_out); 
 erase(f_in);
 rename(f_out, 'listtst.txt');
end.