const
 s1 = 't1';
 s2 = 't2';
 s3 = 'result.dat';

procedure OutputFile(filename: string);
var
  f: file of integer;
  i: integer;
begin
  writeln(filename, ':');
  assign(f, filename);
  reset(f);
  
  while not eof(f) do
  begin
    read(f, i);
    write(i, ' ');
  end;
  writeln;
  
  close(f);
end;

var
  f1, f2, f3: file of integer;
  k, k1, k2, k3: integer;
  //s1, s2, s3: string;
  write_done, skip_k1, skip_k2: boolean;
begin
  //write('first file name=');
  //readln(s1);
  assign(f1, s1);
  reset(f1);

  //write('second file name=');
  //readln(s2);
  assign(f2, s2);
  reset(f2);
  
  //write('output file name=');
  //readln(s3);
  assign(f3, s3);
  rewrite(f3);    
   
  skip_k1 := false;
  skip_k2 := false;
  
  while not eof(f1) and not eof(f2) do
  begin  
    if not skip_k1 then 
      read(f1, k1);
    
    if not skip_k2 then
      read(f2, k2);
    
    if k1 = k2 then
    begin
      write(f3, k1, k2);
      skip_k1 := false;
      skip_k2 := false;      
    end
    else
      if k1 < k2 then  
      begin
        write(f3, k1);
        skip_k1 := false;
        skip_k2 := true;              
      end  
      else
      begin
        write(f3, k2);
        skip_k1 := true;
        skip_k2 := false;                      
      end;
  end;    
  
  if skip_k1 then 
    k := k1
  else 
    k := k2;
  
  write_done := false;

  while not eof(f1) do
  begin    
    read(f1, k1);      
    if (k < k1) and not write_done then
    begin
      write(f3, k);
      write_done := true;
    end;    
    write(f3, k1);
  end;      

  while not eof(f2) do
  begin    
    read(f2, k2);      
    if (k < k2) and not write_done then
    begin
      write(f3, k);
      write_done := true;
    end;    
    write(f3, k2);
  end;

  if not write_done then
    write(f3, k);
    
  close(f1);
  close(f2);
  close(f3);
  
  OutputFile(s1);
  OutputFile(s2);
  OutputFile(s3);
end.  
  
  