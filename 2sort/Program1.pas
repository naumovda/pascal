program z1;
var
  i,k,n,max1,max2:integer;
  A:array[1..20] of integer;


begin

readln(n);
for i:=1 to n do 
  begin
  readln(A[i]);
  end;

max1:=1;
max2:=2;
for i:=3 to n do
  begin
    if A[i]>=A[max2] Then
      begin
      if A[max2]>=A[max1] Then
        begin
        max1:=max2;
        end;
      max2:=i
      end
    else
      begin
      if A[i]>=A[max1] Then
        max1:=i;
      end;
  end;

for i:=1 to n do
  begin
  write(A[i]);
  write(' ');
  end;

if max1>max2 Then
  begin
  k:=max1;
  max1:=max2;
  max2:=k;
  end;
writeln();
writeln(max1);
writeln(max2);

for i:=max1+1 to max2-1 do
  a[i]:=0;
for i:=1 to n do
  begin
  write(A[i]);
  write(' ');
  end;
end.