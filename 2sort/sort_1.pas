var
  f1, f2, f3: file of integer;
  k1, k2: integer;
  s1, s2, s3: string;
begin
  write('first file name=');
  readln(s1);
  assign(f1, s1);
  reset(f);

  write('second file name=');
  readln(s2);
  assign(f2, s2);
  reset(f2);
  
  write('output file name=');
  readln(s3);
  assign(f3, s3);
  rewrite(f3);  
  
  if not eof(f1) then
    read(f1, k1);
  
  if not eof(f2) then
    read(f2, k2);
    
  while not eof(f1) and not eof(f2) do
  begin    
    if k1 = k2 then
    begin
      write(f3, k1);
      write(f3, k2);
    end
    else
      if k1 < k2 then
      begin
        write(f3, k1);
        read(f1, k1);
      end
      else
      begin
        write(f3, k2);
        read(f2, k2);
      end;   
  end;
  
  while not eof(f1) do
  begin    
    read(f1, k1);
    write(f3, k1);
  end;  
  
  while not eof(f2) do
  begin    
    read(f2, k2);
    write(f3, k2);
  end;  
  
  close(f1);
  close(f2);
  close(f3);
end.  
  
  