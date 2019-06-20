var
  f: file of integer;
  s: string;
  i: integer;
begin
  write('file name=');
  readln(s);
  assign(f, s);
  rewrite(f);
  repeat
    try
      write('>');
      readln(i);
    except 
      break;
    end;
    write(f, i);  
  until false;  
  close(f);
end.
  
 