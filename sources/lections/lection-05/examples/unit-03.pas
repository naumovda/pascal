unit Complex; //заголовок модуля

interface
	type
		//тип данных для хранения вещественной и мнимой части
		TСElem = real;
		
		//структура данных для работы с комплексными числами
		TComplex = record
			Re, //вещественная часть
			Im: TСElem; //мнимая часть
		end;
	const
		//типизированные константы
		C_ZERO: TComplex = (Re:0; Im:0);
		C_ONE: TComplex = (Re:1; Im:0);
		C_IM_ONE: TComplex = (Re:0; Im:1);

	//заголовки открытых процедур и функций
	procedure Init(var A: TComplex; Re, Im: TСElem);

	procedure Add(const A, B: TComplex; var C: TComplex); //сложение
	procedure Sub(const A, B: TComplex; var C: TComplex); //вычитание
	procedure Mul(const A, B: TComplex; var C: TComplex); //умножение
	procedure Div(const A, B: TComplex; var C: TComplex); //деление

	procedure Conj(const A: TComplex; var B: TComplex); //получение сопряженного числа

	//получение модуля и аргумента
	function GetModule(const A: TComplex): TCElem;
	function GetArgument(const A: TComplex): TCElem;

end. 	
