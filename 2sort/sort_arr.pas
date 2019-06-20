const
 s1 = 'test1';
 s2 = '0';
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

procedure ReadFromFile(filename: string; var arr: array of integer);
var
  f: file of integer;
  i, n: integer;
begin
  assign(f, filename);
  reset(f);
  
  n := 0;
  while not eof(f) do
  begin
    read(f, i);
    setlength(arr, n+1);
    arr[n] := i;
    n := n + 1;
  end;
  
  close(f);
end;

var
  f1, f2, f3: file of integer;
  
  arr1, arr2: array of integer;
  
  k, k1, k2, k3, n1, n2: integer;
  //s1, s2, s3: string;
  write_done, skip_k1, skip_k2: boolean;
begin
  //write('first file name=');
  //readln(s1);
  ReadFromFile(s1, arr1);

  //write('second file name=');
  //readln(s2);
  ReadFromFile(s2, arr2);
  
  //write('output file name=');
  //readln(s3);
  assign(f3, s3);
  rewrite(f3);    
 
  k1 := 0; n1 := length(arr1);
  k2 := 0; n2 := length(arr2);
  
  while (k1 < n1) and (k2 < n2) do
  begin  
    if arr1[k1] < arr2[k2] then  
    begin
      write(f3, arr1[k1]);
      k1 := k1 + 1;
    end  
    else
    begin
      write(f3, arr2[k2]);
      k2 := k2 + 1;
    end;
  end;    
  
  while k1 < n1 do
  begin    
    write(f3, arr1[k1]);
    k1 := k1 + 1;
  end;      

  while k2 < n2 do
  begin    
    write(f3, arr2[k2]);
    k2 := k2 + 1;
  end;
    
  close(f3);
  
  OutputFile(s1);
  OutputFile(s2);
  OutputFile(s3);
end.  
  
  