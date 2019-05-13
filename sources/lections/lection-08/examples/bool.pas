program bool;

type
  TPByte = ^byte;

var
  b: boolean;
  p: pointer;
  bt : byte;
begin
  writeln('size of boolean = ', sizeof(b));

  p := @b;

  b := True;
  bt := TPByte(p)^;
  writeln('true is ', bt);

  b := False;
  bt := TPByte(p)^;
  writeln('false is ', bt);
end.

