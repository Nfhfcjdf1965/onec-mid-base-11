
#Область ПрограммныйИнтерфейс

// Код процедур и функций

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

// Код процедур и функций

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция СкидкаПокупатель(Контрагент,Дата)Экспорт
	
	Запрос = Новый Запрос;
	Запрос. Текст = "ВЫБРАТЬ
	                |	СкидкиПоследние.Контрагент КАК Контрагент,
	                |	ЕСТЬNULL(СкидкиПоследние.Скидка,0) КАК Скидка
	                |ИЗ
	                |	РегистрСведений.НАШ_СкидкиКонтрагенты.СрезПоследних(&Дата, Контрагент = &Контрагент) КАК СкидкиПоследние";
	
	Запрос.УстановитьПараметр("Контрагент", Контрагент); 
	Запрос.УстановитьПараметр("Дата", КонецДня(Дата)); 
	Результат = Запрос.Выполнить();
	Выборка = Результат.Выбрать();
	
	Если Выборка.Следующий() Тогда
		Возврат Выборка.Скидка;
	Иначе 	
		Возврат Неопределено;
	КонецЕсли;

КонецФункции	

#КонецОбласти
