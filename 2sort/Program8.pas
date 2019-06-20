type
  //типы компетенций
  TCompType = (OK, OPK, PK);
    
  //коды компетенций
  TCompCode = (ok1, ok2, ok3, opk1, opk2);  
  
  //компетенция
  TCompetention = record
    CompType: TCompType;
    Name: string;
    Activity: string;
  end;
  
  //множество компетенций
  TCompSet = set of TCompCode;
  
  //дисциплины
  TDiscipline = record
    Code: string;
    Name: string;
    CompSet: TCompSet;
  end;

var
  //список всех компетенций
  Comps: array[TCompCode] of TCompetention;
  
  //список всех дисциплин
  Disc: array[1..2] of TDiscipline;
begin
  Comps[ok1].CompType := OK;
  Comps[ok1].Name := 'OK-1';
  Comps[ok1].Activity := '';
  
  Disc[1].Code := 'Б1.1.01';
  Disc[1].Name := 'Иностранный язык';
  Disc[1].CompSet := [ok3];
end.