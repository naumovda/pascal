program testing_unit;

type
  TCode = string[10];
  TName = string[80];

  TAnswer = record
    AnswerText: TName;
    IsSelected: boolean;
    IsCorrect: booleaan;
  end;

  TQuestion = record
    QuestionText: TName;
    IsRadio: boolean;
    Difficult: byte;
    Answers: array of TAnswer;
  end;

  TTest = record
    Number: byte;
    Title: TName;
    Version: TCode;
  end;

begin
end.

