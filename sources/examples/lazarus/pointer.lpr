program pointers;

type
  TPLongint = ^longint;

var
  p: pointer;
  r: real;
  i: longint;

begin
  r := 0.2;
  p := @r;
  i := TPLongint(p)^;

  writeln(i);
end.

