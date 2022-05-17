﻿
Процедура ОбработкаПроведения(Отказ, Режим)
	
	      //Если цель затраты - кошелек, то это перевод и мы делаем два проведения ТОЛЬКО по регистру кошельков и ни одного по затратам
		  Если ТипЗнч(Цель) = Тип("СправочникСсылка.Кошельки") Тогда
			        //1. Списываем с кошелька-источника
		            Движения.Кошельки.Записывать = Истина;
	                Движение = Движения.Кошельки.Добавить();
	                Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
	                Движение.Период = Дата;
	                Движение.Кошелек = Кошелек;
					Движение.Статья = Справочники.Статьи.Перевод;//ПРЕДОПРЕДЕЛЕННЫЙ!
	                Движение.Сумма = Сумма;
	                //2. Добавляем в кошелек-получатель
                    Движения.Кошельки.Записывать = Истина;
					Движение = Движения.Кошельки.Добавить();
					Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
					Движение.Период = Дата;
					Движение.Кошелек = Цель;
					Движение.Статья = Справочники.Статьи.Перевод;//ПРЕДОПРЕДЕЛЕННЫЙ!
					Движение.Сумма = Сумма;
					
		 //Если же это просто затрата - делаем проводку и по затратам, и по кошелькам!
         //(оставляем то, что было сформировано конструктором)
	     Иначе
		          //{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
                  // Данный фрагмент построен конструктором.
                  // При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
				  
				  // регистр Кошельки Расход
                  Движения.Кошельки.Записывать = Истина;
                  Движение = Движения.Кошельки.Добавить();
                  Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
                  Движение.Период = Дата;
                  Движение.Кошелек = Кошелек;
                  Движение.Сумма = Сумма;
                  Движение.Статья = Цель;
				  
				  // регистр Затраты 
	              Движения.Затраты.Записывать = Истина;
	              Движение = Движения.Затраты.Добавить();
	              Движение.Период = Дата;
	              Движение.Статья = Цель;
	              Движение.Сумма = Сумма;
	              Движение.Кошелек = Кошелек;

	              //}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
				  
		КонецЕсли;
			  
КонецПроцедуры