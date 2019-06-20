program MyFristProgram;
const       //константы
  Nmax = 10; //размерность массива
  Dig = 2;  //точность представления
  Debug = true;
type
  //описание типов данных
  TIndex = 1..Nmax; //тип индексов
 
  TElem = real;
  TVector = array[TIndex] of TElem;  
var //описание переменных
  i,k : TIndex; //i - индексная переменная
  tmp: TElem;
  
  MyVector: TVector; 
 
begin //блок операторов     
  for i:=1 to NMax do
    MyVector[i] := random(10) / (random(5)+1);         
 
  writeln('Вектор V до сортировки:');
  for i:=1 to NMax do
    write(MyVector[i]:Dig+4:Dig);
  writeln;
  
  for i:=1 to NMax-1 do
  begin
    for k:=i downto 1 do    
      if MyVector[k] > MyVector[k+1] then
      begin
        tmp := MyVector[k];
        MyVector[k] := MyVector[k + 1];
        MyVector[k + 1] := tmp;        
      end;
      
    if Debug then
    begin
      writeln('Вектор V на итерации номер ', i);
      for k:=1 to NMax do
        write(MyVector[k]:Dig+4:Dig);
      writeln;
    end; 
  end;

  writeln('Вектор V после сортировки:');
  for i:=1 to NMax do
    write(MyVector[i]:Dig+4:Dig);
  writeln;  
end.

  
  