const
  BASE = 8;
type  
  TBase = 0..BASE-1;
  TDigits = set of TBase;

var
  n, m: word;
  s: TDigits;
  d: TBase;
  
begin
  write('n='); readln(n);
  
  m := n;
  if m < 0 then m := -m;
  
  writeln;
  s := [];
  while m > 0 do
  begin
    write(m mod BASE);
    s := s + [m mod BASE];
    m := m div BASE;
  end;
  writeln;
  
  writeln('8-Digits in ', n);
  for d := 0 to BASE-1 do
    if d in s then
      write(d);
end.