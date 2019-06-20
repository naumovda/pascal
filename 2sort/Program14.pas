function s(n:integer):integer;
begin
  s := n mod 10 
    + (n div 10 mod 10)
    + (n div 100 mod 10); 
end;

var
  sm: integer;
begin
  sm := 0;
  for var i:integer := 1 to 999999 do
  begin
    if s(i mod 1000) = s(i div 1000) then
      sm := sm + 1;
  end;
  writeln(sm);
end.  
