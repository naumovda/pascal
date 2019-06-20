unit Criteria;

interface

type
  TMark = record
    Name: string;
    Level: integer;
  end;
  
  TCriterion = record
    ID, Name: string;
    Marks: array of TMark;
  end;
  
  TCritArray = array of TCriterion;
  
  TFile = text;

  function GetCriteria:TCritArray;
  procedure Load(var arr: TCritArray);
  procedure Save(arr: TCritArray);
  
  procedure Print(arr: TCritArray; PrintMarks: boolean);

  procedure AddCriterionDlg;
  function AddCriterion(var arr: TCritArray; var crit: TCriterion):integer;

  procedure DelCriterionDlg(var arr: TCritArray);
  function DelCriterionById(var arr: TCritArray; id: string):integer;
  function DelCriterionByIndex(var arr: TCritArray; idx: integer):integer;
  
  //procedure EditCriterionDlg(var arr: TCritArray);
  function EditCriterion(var arr: TCritArray; idx: string):integer;

  function CalcMark(arr: TCritArray; idx: string; user_res, max: integer): string;


implementation
const
  TAGCRIT = '[criterion]';
  TAGMARK = '[mark]';
  FNAME = 'grades.txt';
  
var
  arr: TCritArray;
  
function GetCriteria:TCritArray;
begin
  GetCriteria := arr;
end;

function GetErrorText(err:integer):string;
begin
  case err of
   0: GetErrorText := '';
  -1: GetErrorText := 'Код критерия не задан';
  -2: GetErrorText := 'Критерий с заданным кодом уже существует';
  -3: GetErrorText := 'Список оценок для критерия не может быть пустым';
  -4: GetErrorText := 'Код оценки не задан';
  -5: GetErrorText := 'Оценка с заданным кодом уже существует';
  -6: GetErrorText := 'Оценка с заданным наименованием уже существует';
  -7: GetErrorText := 'Критерий не найден';
  else
    GetErrorText := 'Код ошибки неизвестен';  
  end;
end;

procedure ReadCriterionHeader(var f: TFile; var cr: TCriterion);
begin
  with cr do
  begin
    readln(f, ID);
    readln(f, Name);
  end;
end;

procedure ReadMarks(var f: TFile; var mrk: TMark);
begin
  with mrk do
  begin
    readln(f, Name);
    readln(f, Level);
  end;
end;

procedure Load(var arr: TCritArray);
var
  alen, mlen: byte;
  s: string;
  f: TFile;
  
begin
  assign(f, FNAME);
  reset(f);
  
  alen := 1;
  readln(f, s);
  while not eof(f) do
  begin
    setlength(arr, alen);
  
    if s = TAGCRIT then
    begin
      ReadCriterionHeader(f, arr[alen-1]);
      readln(f, s);
    end;
      
    mlen := 1;
    while s = TAGMARK do
    begin
      setlength(arr[alen-1].Marks, mlen);
      
      ReadMarks(f, arr[alen-1].Marks[mlen-1]);
      readln(f, s);
      
      mlen := mlen + 1;
    end;
    alen := alen + 1;
  end;
  close(f);
end;

procedure Save(arr: TCritArray);
var
  f : TFile;
  
begin
  assign(f, FNAME);
  rewrite(f);
  
  for var i := low(arr) to high(arr) do
  begin
    writeln(f, TAGCRIT);
    
    with arr[i] do
    begin
      writeln(f, ID);
      writeln(f, Name);
      
      for var j := low(Marks) to high(Marks) do
      begin
        writeln(f, TAGMARK);
        
        with Marks[j] do
        begin
          writeln(f, Name);
          writeln(f, Level);
        end;
      end;
      
    end;
  end;
  
  close(f);
end;

procedure Print(arr: TCritArray; PrintMarks: boolean);
begin
  for var i := low(arr) to high(arr) do
    with arr[i] do
    begin
      writeln(ID);
      writeln(Name);
      
      if PrintMarks then
        for var j := low(Marks) to high(Marks) do
          with Marks[j] do
            writeln(Name, ' ', Level);
    end;
end;

procedure Sort(var arr: array of TMark);
var
  tmp: TMark;
begin
  for var i := low(arr) to high(arr) - 1 do
    for var j := i downto low(arr) do
      if arr[j].Level < arr[j + 1].Level then
      begin
        tmp := arr[j];
        arr[j] := arr[j + 1];
        arr[j + 1] := tmp;
      end;
end;

function FindCriterion(arr: TCritArray; idx: string): integer;
begin
  for var i := low(arr) to high(arr) do
    if arr[i].ID = idx then
    begin
      FindCriterion := i;
      exit;
    end;
  
  FindCriterion := -1;
end;

function FindMarkByLevel(var crit: TCriterion; level: integer): integer;
begin
  for var i := low(crit.Marks) to high(crit.Marks) do
    if crit.Marks[i].Level = level then
    begin
      FindMarkByLevel := i;
      exit;
    end;
    
  FindMarkByLevel := -1;
end;

function FindMarkByName(var crit: TCriterion; name: string): integer;
begin
  for var i := low(crit.Marks) to high(crit.Marks) do
    if crit.Marks[i].Name = name then
    begin
      FindMarkByName := i;
      exit;
    end;
    
  FindMarkByName := -1;
end;

procedure InputCriterion(var ID, name: string);
begin  
  write('input ID:');
  readln(ID);
  write('input name:');
  readln(Name);
end;

procedure InputMark(var name: string; var level: integer);
begin  
  write('input mark name:');
  readln(Name);
  write('input level:');
  readln(Level);
end;

function AddMark(var crit: TCriterion; var name: string; 
  var level:integer):integer;
var
  count: integer;
begin
  if name = '' then
  begin
    AddMark := -4;
    exit;
  end;
  
  if FindMarkByLevel(crit, level) <> - 1 then
  begin
    AddMark := -5;
    exit;
  end;

  if FindMarkByName(crit, name) <> - 1 then
  begin
    AddMark := -6;
    exit;
  end;

  setlength(crit.Marks, length(crit.Marks) + 1);
  
  count := high(crit.Marks);
  
  crit.Marks[count].Name := name;
  crit.Marks[count].Level := level;
      
  AddMark := 0;    
end;

function AddCriterion(var arr: TCritArray; var crit: TCriterion):integer;
begin
  if crit.ID = '' then
  begin
    AddCriterion := -1;
    exit;
  end;
  
  if FindCriterion(arr, crit.ID) <> - 1 then
  begin
    AddCriterion := -2;
    exit;
  end;
  
  if Length(crit.Marks) = 0 then
  begin
    AddCriterion := -3;
    exit;
  end;  
  
  setlength(arr, length(arr) + 1);
  
  sort(crit.Marks);
  
  arr[high(arr)] := crit;  
    
  AddCriterion := 0;    
end;

procedure AddCriterionDlg();
var 
  cr: TCriterion;
  i, marks: integer;
  ErrorCode: integer;
  
  id, name: string;
  level: integer;
  
  arr: TCritArray;
begin
  arr := GetCriteria;
  
  InputCriterion(id, name);
  
  cr.ID := id;
  cr.Name := name;
  
  write('Input marks count:');
  readln(marks);
  
  for i := 1 to marks do
  begin
    repeat
      InputMark(name, level);
    
      ErrorCode := AddMark(cr, name, level);
      
      if ErrorCode <> 0 then
      begin
        writeln(GetErrorText(ErrorCode));
        writeln('повторить ввод!');
      end;
    until ErrorCode = 0;    
  end;
  
  ErrorCode := AddCriterion(arr, cr);
  
  if ErrorCode <> 0 then
    writeln(GetErrorText(ErrorCode));    
end;

procedure DelCriterionDlg();
var
  arr: TCritArray;
begin
  arr := GetCriteria;

  writeln('Select criterion to delete');
  
  //Print(
  
  write('set new ID: ');
  //readln(ID);
end;

function DelCriterionByIndex(var arr: TCritArray; idx: integer):integer;
begin
  if (idx < low(arr)) or (idx > high(arr)) then
  begin
    DelCriterionByIndex := -7;
    exit;
  end;
  
  for var j := idx to high(arr)-1 do
    arr[j] := arr[j + 1];
  
  setlength(arr, length(arr)-1);
end;

function DelCriterionById(var arr: TCritArray; id: string): integer;
begin
  DelCriterionById := DelCriterionByIndex(arr, FindCriterion(arr, id));
end;

procedure EditCriterion(var arr: TCritArray; idx: string);
begin
  with arr[FindCriterion(arr, idx)] do
  begin
    write('set new ID: ');
    readln(ID);
    write('set new name: ');
    readln(Name);
    
    for var j := low(Marks) to high(Marks) do
    begin
      write('set new mark ', j, ' name: ');
      readln(Marks[j].Name);
      write('set new level: ');
      readln(Marks[j].Level);
    end;
    
    Sort(Marks);
  end;
end;

function CalcMark(arr: TCritArray; idx: string; user_res, max: integer): string;
var
  score: real;
  j: byte;
begin
  score := (user_res / max)*100;

  with arr[FindCriterion(arr, idx)] do
  begin
    j := low(Marks);
    while score < Marks[j].Level do
    begin
      j := j + 1;
    end;
    CalcMark := Marks[j].Name;
  end;
end;


begin
end. 