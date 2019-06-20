const
  size = 20;
type
  matr = array[1..size, 1..size] of integer;
  massiv = array[1..size] of integer;

function kolstb(a: matr; m, n: integer): integer;
var
  i, j, k, p: integer;
begin
  k := 0;//кол столб без 0
  for j := 1 to m do //смотрим все столбцы
  begin
    p := 0; //пока нулей нет
    i := 1;
    while (i <= n) and (p = 0) do //пока не ноль и не конец строки
      if a[i, j] = 0 then p := 1 //если ноль меняем значение на "ложь"
      else i := i + 1;//иначе идем вперед
    if p = 0 then k := k + 1;//если нет 0, считаем
  end;
  kolstb := k;//возвращаемое значение
end;

function ch(const a: matr; number, cols: integer):integer;
var
  i, j, s: integer;
begin
  s := 0;
  
  for j := 1 to cols do
    if (a[number, j] > 0) and (a[number, j] mod 2 = 0) then
      s := s + a[number, j];
  
  ch := s;
end;

procedure swap(var a: matr; row1, row2, cols: integer);
var
  k, t: integer;
begin
  for k := 1 to cols do
  begin
    //выполняется перестановка элементов местами
    t := A[row1, k];
    A[row1, k] := A[row2, k];
    A[row2, k] := t;
  end;
end;

//Переставляем строки заданной матрицы по росту характеристики 
procedure sort_ch(var a: matr; rows, cols: integer);
var
  i, j: integer;
begin
  for i := 1 to rows-1 do
    for j := i+1 to rows do
      if ch(a, i, cols) > ch(a, j, cols) then
        swap(a, i, j, cols);        
end;

procedure init(var a: matr; rows, cols: integer; start, finish: integer);
var
  i, j: integer;
begin
  for i := 1 to rows do
    for j := 1 to cols do
      //определяет диапазон случайных чисел.
      a[i, j] := random(finish-start) + start;
end;

procedure print(const a: matr; rows, cols: integer; msg: string);
var
  i, j: integer;
begin
  writeln(msg);
  for i := 1 to rows do
  begin
    for j := 1 to cols do
      write(A[i, j]:4);
    writeln;
  end;
  writeln;  
end;

var
  a: matr;
  n, m: integer;

begin
  write('Введите кол-во строк: '); readln(m);
  write('Введите кол-во столбцов: '); readln(n);
  
  init(a, m, n, -5, 5);
  print(a, m, n, 'Исходная матрица:');
  
  writeln('Количество столбцов без нолей = ', kolstb(a, m, n));
  writeln;
  
  sort_ch(a, m, n);
  
  print(a, m, n, 'Преобразованная матрица:');
end.