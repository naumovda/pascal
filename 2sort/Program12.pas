function PowerNat(x: real; n:integer): real;
var
  i: integer;  
  y: real;
begin
  y := 1;
  for i := 1 to n do
    y := y * x;      
 
  PowerNat := y;
end;

function testPowerNat1(): boolean;
begin
  testPowerNat1 := PowerNat(2, 2) = 4;
end;

function testPowerNat2(): boolean;
begin
  testPowerNat2 := PowerNat(1, 0) = 1;
end;

function testPowerNat3(): boolean;
begin
  testPowerNat3 := PowerNat(-2, 4) = 16;
end;

begin
  writeln(testPowerNat1);
  writeln(testPowerNat2);
  writeln(testPowerNat3);
end.