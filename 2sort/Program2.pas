{$n+}
var
  i, j: BigInteger;
  isSimple: Boolean;
  
  
begin
  isSimple := false;
  
  i := 7778742049;

  j := 2;
  
  while j < i-1 do
  begin
    if i mod j = 0 then
    begin
      writeln(j, '-divider');
      
      isSimple := false;
      
      break;
    end;    
    
    j := j + 1;
  end;
  
  if isSimple then
    write('Simple');
end.