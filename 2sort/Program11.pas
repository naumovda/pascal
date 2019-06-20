type
  TVector = array[1..100] of real;

function Min(V:TVector; n:integer):real;
var
  i: integer;
  m: real;
begin
  m := v[1];
  
  for i := 2 to n do
    if v[i] < m then
      m := v[i];
  
  Min := m;
end;

var 
  vect: TVector;
begin
  vect[1] := 12; 
  vect[2] := 34;
  vect[3] := 65;
  vect[4] := 76;
  vect[5] := 11;
  
  writeln(Min(vect, 5));
end.