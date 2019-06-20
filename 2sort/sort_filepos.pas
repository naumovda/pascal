const
 s1 = 'input.dat';
 s2 = 'input2.dat';
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
  
  k1, k2, n1, n2, v1, v2: integer;

  //s1, s2, s3: string;
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
 
  k1 := 0; n1 := filesize(f1);
  k2 := 0; n2 := filesize(f2);
  
  while (k1 < n1) and (k2 < n2) do
  begin
    seek(f1, k1);
    seek(f2, k2);
    read(f1, v1);
    read(f2, v2);
    if v1 < v2 then  
    begin
      write(f3, v1);
      k1 := k1 + 1;
    end  
    else
    begin
      write(f3, v2);
      k2 := k2 + 1;
    end;
  end;    
  
  seek(f1, k1);
  seek(f2, k2);

  while not eof(f1) do
  begin 
    read(f1, v1);
    write(f3, v1);
  end;      

  while not eof(f2) do
  begin    
    read(f2, v2);
    write(f3, v2);
  end;
 
  close(f1);
  close(f2);
  close(f3);
  
  OutputFile(s1);
  OutputFile(s2);
  OutputFile(s3);
end.  
  
  