var
  f: text;
  m,n : integer;
begin
  assign(f, 'ex_01.txt');
  rewrite(f);
  writeln('Введите количество строк: ');
  readln(m); 

  for var i:integer := 1 to m do  
  begin
    for var j:integer := 1 to m do
      write(f, random(30)-15, ' ');            
    writeln(f);  
  end;
  close(f);
end.


