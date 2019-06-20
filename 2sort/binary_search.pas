type
  TElem = integer;  
  TIndex = byte;  
  TArray = array[TIndex] of TElem;  

function find_left(key: TElem; const a: TArray; size, left, right: TIndex): TIndex;
var
  mid: TIndex;
begin
  if right = left then
  begin
    if a[left] = key then
      find_left := left
    else
      find_left := left - 1;         
  end
  else
  begin
    mid := (right + left) div 2;
    
    if a[key] > mid then
      find_left := find_left(key, a, size, mid, right)
    else
      find_left := find_left(key, a, size, left, mid);
  end;
end;

var
  m: TArray;
  
  left: TIndex;
begin
  m[1] := 0;
  m[2] := 1;
  m[3] := 2;
  m[4] := 2;
  m[5] := 2;
  m[6] := 5;
  m[7] := 5;
  m[8] := 10;
  m[9] := 10;
  
  left := find_left(2, m, 9, 0, 10);
  
  write(left);
end.