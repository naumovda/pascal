program dyn_list;

type
  //указатель на элемент списка
  PElement = ^TElement;

  //элемент списка
  TElement = record
    Data: real;
    Next: PElement;
  end;


procedure ClearList(var L: PElement);
begin
  L := nil;
end;

procedure CreateList(var L: PElement);
begin
  L := nil;
end;

var
  List: PElement;
begin
end.

