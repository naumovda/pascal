program Complex;
type
  TData = double;
  
  TComplex = record
    Re, Im: TData;    
    //Module, Arg: TData; 
  end;
  
  TComplexTrig = record
    Module, Arg: TData;
  end;
var
  a, b, c, d, im: TComplex;
  at: TComplexTrig;  
  
begin
  //задать значение мнимой единицы
  im.Re := 0; im.Im := 1;
  
  a.Re := 10; a.Im := 12;
  b.Re := -20; b.Im := -4;
  
  {находим сумму}
  c.Re := a.Re + b.Re;
  c.Im := a.Im + b.Im;
  
  {находим произведение}
  d.Re := a.Re * b.Re - a.Im * b.Im;
  d.Im := a.Re * b.Im + a.Im * b.Re;
  
  {расчет модуля и аргумента числа a}
  
  a.Re := 1;
  a.Im := -1;
  
  at.Module := sqrt(a.Re*a.Re + a.Im*a.Im);
  
  if abs(a.Re) < 1e-6 then
  begin
    if a.Im > 0 then 
      at.Arg := Pi / 2
    else
      at.Arg := - Pi / 2;
  end
  else 
    if a.Re > 0 then
      at.Arg := arctan(a.Im / a.Re)
    else if a.Re < 0 then
      if a.Im >= 0 then 
        at.Arg := arctan(a.Im / a.Re) + Pi
      else
        at.Arg := arctan(a.Im / a.Re) - Pi;

  writeln('mod:', at.Module:6:4, ' arg:', at.Arg);    
end.