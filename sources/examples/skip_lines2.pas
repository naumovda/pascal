type
 TTest = record
   Code, FileName: string;
 end;

var
 f_in: Text;
 
 arr: array of TTest;
 
 i, n: integer; 
 
 s1, s2: string;
begin
 n := 5;
 
 i := 0;
 
 assign(f_in, 'listtst.txt');
 reset(f_in);
 
 while not eof(f_in) do
 begin
   i := i + 1;
   
   SetLength(arr, i);
   
   readln(f_in, arr[i].Code);  
   
   if eof(f_in) then break;
   
   readln(f_in, arr[i].FileName);
 end;
 
 close(f_in);
 
 rewrite(f_in);
 
 for i := low(arr) to high(arr) do 
   if i <> n then
   begin
     writeln(f_in, arr[i].Code);   
     writeln(f_in, arr[i].FileName);    
   end;    

 close(f_in);  
end.