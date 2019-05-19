program testing_unit;

type
  TCode = string[10];
  TName = string[80];

  TVariant = record
    AnswerText: TName;
    IsSelected: boolean;
    IsCorrect: booleaan;
  end;

  TQuestion = record
    QuestionText: TName;
    IsRadio: boolean;
    Difficult: byte;
    Variants: array of TVariant;
    IsCorrect: boolean;
    Score: word;
  end;

  TTest = record
    Number: byte;
    Title: TName;
    Version: TCode;
    Score: word;
  end;

begin
end.

