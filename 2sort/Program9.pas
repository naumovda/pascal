var 
  a, b: BigInteger; 
  r, s, t, c: double;
  i, d: integer;
begin
  r := 100/3;
  
  a := trunc(r);
  
  d := 16;
  
  c := r - trunc(r); //дробная часть
  
  b := 0;
  i := d;
  while i > 0 do
  begin
    b := b * 10 + trunc(c*10);
    
    c := c * 10 - trunc(c*10);
    
    i := i - 1;
  end;
  
  writeln(r);
  writeln(a);
  writeln(b);
end.  