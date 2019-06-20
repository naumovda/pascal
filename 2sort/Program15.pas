const
  NMAX = 10;
type
  TArray = array[1..NMAX] of real;

function GetMinIndex(var arr: TArray; const start, finish: integer):integer;
var
  idx: integer;
begin
  idx := start;
  
  for i: integer := start+1 to finish do
    if arr[i] < arr[idx] then
      idx := i;
  
  GetMinIndex := idx;
end;

procedure Swap(var arr: TArray; i, j: integer);
var
  tmp: real;
begin
  if i = j then exit;
  
  tmp := arr[i]; //arr[i],arr[j] = arr[j],arr[i];
  arr[i] := arr[j];
  arr[j] := tmp;
end;

procedure SortByGetMin(var arr: TArray; const n: integer);
begin
  for i:integer := 1 to n-1 do
    Swap(arr, i, GetMinIndex(arr, i, n));
end;

procedure SortByGetMinRec(var arr: TArray; const n, i: integer);
begin
  if i >= n then exit;
  
  Swap(arr, i, GetMinIndex(arr, i, n));
  
  SortByGetMinRec(arr, n, i+1);
end;

var
 a, b: TArray;
begin
 for i: integer := 1 to NMAX do
   a[i] := random(100);
 
 b := a;
 
 writeln(a);
 
 SortByGetMin(a, NMAX);
 
 writeln('non req:', a);
 
 SortByGetMinRec(b, NMAX, 1);
 
 writeln('req:', b);
end.