const
  _START = 0;
  _END = 9;
type
  TBaseType = _START.._END;  
  TSet = set of TBaseType;
var
  s: TSet;
  n, m: word;
  count: byte;
  c: TBaseType;
begin
  n := 11111; //исходное число
  
  s := [];
  
  m := n;
  
  while m > 0 do
  begin
    c := m mod 10;
    m := m div 10;
    
    s := s + [c];    
  end;
  
  count := 0;
  
  write('s = [');
  for c := _START to _END do
    if c in s then
    begin
      write(c, ' ');
      
      count := count + 1;
    end;
  writeln(']');
  
  writeln('Count of digits:', count);  
end.
