function PowerNat(x: real; n:integer): real;
var
  i: integer;  
  y: real;
begin
  //writeln('call PowerNat (', x:6:4, ', n=', n, ')');
  
  y := 1;
  for i := 1 to n do
    y := y * x;  
    
  //writeln('ret PowerNat=', y:6:4);
  
  PowerNat := y; {возращаем значение}
end;

var
  x, y: real;
begin
  x := 2;
  
  y := PowerNat(x+1, 7*2);    
      
  writeln('x=', x:6:4, ' y=', y:6:4);
end.