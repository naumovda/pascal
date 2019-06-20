//const
// ['_', 'A'..'Z', 'a'..'z'] - first
// ['_', 'A'..'Z', 'a'..'z', '0'..'9'] - next
var
  s: string; 
  
  b: boolean;
begin
  s := '_inform12';
  
  b := s[1] in ['_', 'A'..'Z', 'a'..'z'];
  
  if b = True then
    for i: integer := 2 to length(s) do
    begin
      b := b and (s[i] in ['_', 'A'..'Z', 'a'..'z', '0'..'9']); 
            
      writeln('current: ', i, ' ', s[i], ' ', b);
      
      if b = False then break;
    end;
  
  writeln('is identifier: ', b);
end.