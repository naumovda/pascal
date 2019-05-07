program dyn_list;

const
  eps = 1e-6;

type
  //тип данных - данные элемента списка
  TData = real;

  //указатель на элемент списка
  PElement = ^TElement;

  //элемент списка
  TElement = record
    Data: TData;
    Next: PElement;
  end;

function IsEmpty(const List: PElement):boolean;
begin
  IsEmpty := List = nil;
end;

procedure PrintList(const List: PElement);
var
  p: PElement;
begin
  writeln;
  if IsEmpty(List) then
    write('List is empty')
  else
    begin
      p := List;
      while p <> nil do
        begin
          write(p^.Data:6:2, ' ');
          p := p^.Next;
        end;
    end;
  writeln;
end;

procedure Pop(var List: PElement; var Data: TData; var ErrorCode: integer);
var
  p: PElement;
begin
  if IsEmpty(List) then
  begin
    ErrorCode := -1;
    exit;
  end;

  ErrorCode := 0;
  Data := List^.Data;
  p := List^.Next;
  Dispose(List);
  List := p;
end;

procedure Tail(var List: PElement; var Data: TData; var ErrorCode: integer);
var
  p: PElement;
begin
  ErrorCode := 0;

  if IsEmpty(List) then
    ErrorCode := -1
  else
    if List^.Next = nil then
      begin
        Data := List^.Data;
        Dispose(List);
        List := nil;
      end
    else
      begin
        p := List;
        while p^.Next^.Next <> nil do
          p := p^.Next;
        Data := p^.Next^.Data;
        Dispose(p^.Next);
        p^.Next := nil;
      end;
end;

procedure Append(var List: PElement; const Data: TData);
var
  p: PElement;
begin
  New(p);
  p^.Data := Data;
  p^.Next := List;
  List := p;
end;

procedure InsertAfter(var List, Elem: PElement; const Data: TData);
var
  p: PElement;
begin
  if Elem = nil then
    exit;

  if List = Elem then
    Append(List, Data)
  else
    begin
      new(p);
      p^.Data := Data;
      p^.Next := Elem^.Next;
      Elem^.Next := p;
    end;
end;

procedure Delete(var List, Elem: PElement; var Data: TData;
  var ErrorCode: integer);
var
  p: PElement;
begin
  if Elem = nil then
    ErrorCode := -1
  else
    if List = Elem then
      Pop(List, Data, ErrorCode)
    else
      begin
        p := List;
        while p^.Next <> Elem do
          p := p^.Next;
        p^.Next := Elem^.Next;
        Data := Elem^.Data;
        Dispose(Elem);
      end;
end;

procedure ClearList(var List: PElement);
var
  Data: TData;
  ErrorCode: integer;
begin
  while not IsEmpty(List) do
    Pop(List, Data, ErrorCode);
end;

procedure CreateList(var List: PElement);
begin
  ClearList(List);
  List := nil;
end;

function Find(const List:PElement; const Data: TData):PElement;
var
  p: PElement;
begin
  p := List;
  while (p <> nil) and (abs(p^.Data-Data) > eps) do
    p := p^.Next;
  Find := p;
end;

var
  List, Elem: PElement;

  Data: TData;

  ErrorCode: integer;
begin
  CreateList(List);

  PrintList(List);

  Append(List, 13.1);
  Append(List, 12.1);
  Append(List, -4.2);

  PrintList(List);

  Append(List, 0);

  PrintList(List);

  writeln;

  Elem := Find(List, 12.1);

  if Elem <> nil then
    begin
      writeln('find 12.1');

      Delete(List, Elem, Data, ErrorCode);

      if ErrorCode = 0 then
        writeln('deletion done')
      else
        writeln('deletion fail');
    end
  else
    begin
      writeln('not find 12.1');
    end;

  PrintList(List);

  writeln;

  Elem := Find(List, 0);

  if Elem <> nil then
    begin
      writeln('find 0 at top');

      Delete(List, Elem, Data, ErrorCode);

      if ErrorCode = 0 then
        writeln('deletion done')
      else
        writeln('deletion fail');
    end
  else
    begin
      writeln('not find 12.1');
    end;

  PrintList(List);

  writeln;

  Elem := Find(List, 13.10);

  if Elem <> nil then
    begin
      writeln('find 13.1 at tail');

      InsertAfter(List, Elem, 5.1);

      writeln('insert 5.1 after 13.1');
      PrintList(List);
      writeln;

      Delete(List, Elem, Data, ErrorCode);

      if ErrorCode = 0 then
        writeln('deletion done')
      else
        writeln('deletion fail');

      writeln('deleted 13.1');
      PrintList(List);
      writeln;

      Tail(List, Data, ErrorCode);

      if ErrorCode = 0 then
        writeln('deletion done')
      else
        writeln('deletion fail');

      writeln('deleted tail');
      PrintList(List);
      writeln;
    end
  else
    begin
      writeln('not find 13.1');
    end;

  ClearList(List);

  PrintList(List);

  readln;
end.

