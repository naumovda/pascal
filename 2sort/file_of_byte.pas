var
  f: file of byte;
  b: byte;
begin
  //assign(f, 'test_file.pas');
  assign(f, 'file_21.pas');
  try
    reset(f);
  except
    //
    writeln('File not exist!');
    halt;
  end;  
  while not eof(f) do
  begin
    read(f, b);
    writeln(b);
  end;
  close(f);  
end.
