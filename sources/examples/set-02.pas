﻿//Определение количества различных цифр
//  в десятичной записи числа

Const 
  //первая цифра
  _START = 0;
  
  //последняя цифра
  _END = 9; 

Type 
  //отрезок цифр
  TBaseType = _START.._END;
  
  //тип - множество цифр
  TSet = set Of TBaseType; 

Var 
  //множество цифра числа
  s: TSet;
    
  n, //исходное число
  m: word;  //вспомогательная переменная
  
  //количество цифр
  count: byte;
  
  //цифра (счетчик цикла)
  c: TBaseType;

Begin
  //исходное число
  n := 12311;

  //инициализация при помощи конструктора пустого множества  
  s := [];

  //инициализация вспомогательной переменной
  m := n;

  //формируем множество цифр числа
  While m > 0 Do
    Begin
      //выделяем последнюю цифру числа
      c := m Mod 10;

      //отбрасываем последнюю цифру числа
      m := m Div 10;

      //добавляем цифру ко множеству 
      s := s + [c];
    End;

  //определяем количество элементов множества
  count := 0;

  //перебор всем возможных элементов
  For c := _START To _END Do
    
    //проверка, входит ли элементв в множество
    If c In s Then   
      count := count + 1;

  //выводим множество на экран
  write('s = [');
  
  For c := _START To _END Do
    If c In s Then
      write(c, ' ');
  
  writeln(']');

  writeln('Number ', n, ' contains ', count, ' different digits');
End.
