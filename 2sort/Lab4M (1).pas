program Lab4M;

type
  TIndex = 1.. 100;
  TArray2D = array [TIndex, TIndex] of Integer;
  TArray1D = array [TIndex] of Integer;

procedure Sort(var Mass1: TArray2D; const m, n: Integer);
var
  i, j, count, k, x: Integer;
  Mass2: TArray1D;
begin
  for j := 1 to n do
  begin
    count := 0;
    for i := 1 to m do
      if (Mass1[i, j] < 0) and (odd(Mass1[i, j])) then   
        count := count + Mass1[i, j];
    Mass2[j] := count;    
  end;
  
  for j := 1 to n - 1 do
    for k := j + 1 to n do
      if Mass2[j] > Mass2[k] then
        for i := 1 to m do
        begin
          x := Mass1[i, j];
          Mass1[i, j] := Mass1[i, k];
          Mass1[i, k] := x;
          x := Mass2[j];
          Mass2[j] := Mass2[k];
          Mass2[k] := x;
        end;
end;

procedure Summ(const Mass1: TArray2D; const m, n: Integer; var res: TArray1D); 
var
  i, j, count: Integer;
  Mass2: Tarray1d;
begin
  for j := 1 to m do 
  begin
    count := 0;  
    for i := 1 to n do
      if (Mass1[i, j] < 0)  then 
        count := count + Mass1[i, j];
    Mass2[j] := count;
  end;
  res := Mass2;
end;

var
  v1: TArray2D;
  SummArray: TArray1D;
  i, j, n, m: Integer;

begin
  writeln('Введите количество строк: ');
  readln(m); 
  writeln('Введите количество столбцов: ');
  readln(n);
  
  writeln('Заданный исходный массив: ');  
  for i := 1 to m do //Блок формирования исходного массива
  begin
    writeln;
    for j := 1 to n do
    begin
      V1[i, j] := random(30) - 10;
      write(V1[i, j]:5);      
    end;
  end;
  writeln;
  
  Summ(v1, m, n, SummArray);
  
  for i := 1 to n do
    writeln('Сумма в ', i, ' столбце: ', SummArray[i]:4);
  
  Sort(v1, m, n);
  
  writeln('Отсортированный массив: ');  
  for i := 1 to m do 
  begin
    writeln;
    for j := 1 to n do
      write(V1[i, j]:5);
  end;
end.


