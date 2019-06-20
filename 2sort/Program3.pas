program MyFristProgram;
const       //константы
  Nmax = 4; //размерность массива
  Eps = 1e-6; //погрешность
  Dig = 6;  //точность представления
type
  //описание типов данных
  TIndex = 1..Nmax; //тип индексов
  
  TRowIndex = 1..Nmax; //тип индексов строк
  TColIndex = 1..Nmax; //тип индексов столбцов
  
  TElem = real;
  TVector = array[TIndex] of TElem;
  TMatrix = array[TIndex] of TVector;
var //описание переменных
  i: TRowIndex; //i - индексная переменная
  j: TColIndex;
  
  MyVector: TVector; 
  MyMatrix: TMatrix;
  
  K: TElem;
  Flag: Boolean;
  
begin //блок операторов
  for i:=1 to NMax do
    for j:=1 to NMax do
       MyMatrix[i, j] := random(10) / (random(5)+1);
       
  for i:=1 to NMax do
    MyVector[i] := random(10) / (random(5)+1);       
  
  {
  writeln('Матрица A:');
  for i:=1 to NMax do
  begin
    for j:=1 to NMax do
      write(MyMatrix[i, j]:Dig+2:Dig);
      
    writeln;
  end;
  }  
  
  writeln('Вектор V:');
  for i:=1 to NMax do
    write(MyVector[i]:Dig+4:Dig);
  writeln;
  
  writeln('Введите значение искомого элемента K:');
  readln(K);
  
  Flag := false;
  for i:=1 to NMax do
    if abs(MyVector[i] - K) <= Eps then //сравнение MyVector[i] и K
    begin
      Flag := true;
      
      writeln('Элемент ', K:Dig+4:Dig, ' в массиве найден на позиции ', i);
    end;
    
  if not Flag then
    writeln('Элемент ', K:Dig+4:Dig, ' в массиве не найден!');
  
end.

  
  