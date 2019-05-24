type
  TVariant = record
    Title: string;
    IsCorrect: boolean;
  end;
  
  TQuestion = record
    Title: string;
    Score: integer;
    Variants: array of TVariant;
  end;
  
  TTest = record
    Code, Name: string;
    Questions: array of TQuestion;
  end;

function LoadTest(fileName: string; var T: TTest): boolean;
var
  F: Text;
  i, j, question_cnt, var_cnt: integer;
  str: string;
begin
  Assign(F, fileName);
  Reset(F);
  
  readln(F, T.Code);
  readln(F, T.Name);
  
  readln(F, question_cnt);
  SetLength(T.Questions, question_cnt);
  
  for i := 0 to question_cnt-1 do
  begin
    readln(F, T.Questions[i].Title);
    readln(F, var_cnt);
    readln(F, T.Questions[i].Score); 
    
    SetLength(T.Questions[i].Variants, var_cnt); 
    
    for j := 0 to var_cnt-1 do
    begin
      readln(F, T.Questions[i].Variants[j].Title);
      readln(F, str);
      if str = '0' then
        T.Questions[i].Variants[j].IsCorrect := false
      else
        T.Questions[i].Variants[j].IsCorrect := true;
    end;    
  end;
    
  Close(F);
  
  LoadTest := true;
end;

var
  i, j, question_cnt, var_cnt: integer;
  T: TTest;

begin
  LoadTest('test2.txt', T);     
  
  writeln('код теста=', T.Code);
  writeln('наименование теста=', T.Name);  

  for i := Low(T.Questions) to High(T.Questions) do
  begin
    writeln('Вопрос ', i, ':', T.Questions[i].Title);  
    writeln('Балл=', T.Questions[i].Score); 
    
    for j := Low(T.Questions[i].Variants) to High(T.Questions[i].Variants) do
    begin
      write('    вариант ответа ', j, ':', T.Questions[i].Variants[j].Title);  
      if T.Questions[i].Variants[j].IsCorrect then
        writeln(' верный')
      else
        writeln('  неверный');
    end;    
  end;

end.
  
  