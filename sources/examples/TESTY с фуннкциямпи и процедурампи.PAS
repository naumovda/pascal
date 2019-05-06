Program testy;

type mass=array [1..100] of integer;
     dvum_mass_str=array [1..100,1..100] of string;
     odnom_mass_str= array [1..100] of string;

 var kolvo_voprosov,i,j,p,ball,variant:integer;
     spisok_voprosov:odnom_mass_str;
     spisok_otvetov:dvum_mass_str;
     prav_otvet,oshibki,kolvo_otvetov:mass;


 procedure print_result (ball,kolvo_voprosov,p:integer; oshibki:mass);
  var i:integer;
  begin
   Writeln;
    Writeln('Итоговый балл: ',ball,' из ',kolvo_voprosov,' возможных');
    if p=0 then Writeln('Ошибок допущено не было, поздравляем!')
     else 
      begin
       if p=1 then Writeln('Ошибка была допущена в ',oshibki[p],' вопросе.')
        else
         begin
          Write('Ошибки были допущены в ');
          for i:=1 to p do
           if i=p then Writeln(oshibki[i],' вопросах')
            else Write(oshibki[i],', ');
         end;     
      end;
  end;
  
 function correct_answer(i: integer; kolvo_otvetov:mass): integer;
   var otvet:integer;
   begin
    Write('Введите номер правильного ответа: ');
    repeat
     Readln(otvet);
     if (otvet>kolvo_otvetov[i]) or (otvet<=0) then
      begin
       Writeln;
       Writeln('Ошибка! Введён некорректный вариант ответа. Проверьте его и повторите процедуру.');
       Write('Введите номер правильного ответа: ');
      end;
    until (otvet<=kolvo_otvetov[i]) and (otvet>0);
    correct_answer:=otvet;
    Writeln;
   end;
   
   
 begin  
  ball:=0; p:=0;
  
  Write('Введите количество вопросов теста: ');
  Readln(kolvo_voprosov);
  Writeln;
  For i:=1 to kolvo_voprosov do
   begin
    Write('Введите ',i,' вопрос: ');
    Readln(spisok_voprosov[i]);
    Write('Введите количество ответов: ');
    Readln(kolvo_otvetov[i]);
    
    For j:=1 to kolvo_otvetov[i] do
     begin
      Write('Введите ',j,' ответ: ');
      Readln(spisok_otvetov[i][j]);
      spisok_otvetov[i][j]:=j+') '+spisok_otvetov[i][j];
     end; 
     
    prav_otvet[i]:=correct_answer(i,kolvo_otvetov);    
   end;
   

   Writeln;
   Writeln('Начнём тест:');
   Writeln;
   For i:=1 to kolvo_voprosov do
    begin
     Writeln('Вопрос ',i,': ', spisok_voprosov[i]);
     
     For j:=1 to kolvo_otvetov[i] do
      Writeln(spisok_otvetov[i][j]);
      
     Write('Ваш вариант ответа: ');
     Readln(variant);
     if variant=prav_otvet[i] then ball:=ball+1
      else 
       begin
        p:=p+1;
        oshibki[p]:=i;
       end;
      Writeln;
    end;

    print_result(ball,kolvo_voprosov,p,oshibki);
    
 end.