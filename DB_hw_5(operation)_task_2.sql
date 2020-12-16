/*2. Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR 
* и в них долгое время помещались значения в формате 20.10.2017 8:10. 
* Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения. 
*/
DROP DATABASE IF EXISTS  hw5;
CREATE DATABASE hw5;
USE hw5;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at VARCHAR(255),
  updated_at VARCHAR(255)
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at, created_at, updated_at) 
	VALUES 
		('Геннадий', '1990-10-05', '20.10.2017 8:10', '20.10.2017 8:11'),
		('Наталья', '1984-11-12', '20.10.2018 8:10', '20.10.2017 8:12'),
		('Александр', '1985-05-20', '20.10.2019 8:10', '20.10.2017 8:13'),
		('Сергей', '1988-02-14', '20.10.2010 8:10', '20.10.2017 8:14'),
		('Иван', '1998-01-12', '20.10.2011 8:10', '20.10.2017 8:15'),
		('Мария', '1992-08-29', '20.10.2012 8:10', '20.10.2017 8:16')
	;

-- решение
-- 1 шаг: попробуем привести данные колонках created_at, updated_at к нужному типу
SELECT 
	STR_TO_DATE(created_at, "%d.%m.%Y %k:%i"),
	STR_TO_DATE(updated_at, "%d.%m.%Y %k:%i") 
FROM users;
-- 2 шаг: обновим значения в таблице
UPDATE users 
	SET created_at = STR_TO_DATE(created_at, "%d.%m.%Y %k:%i"), 
		updated_at = STR_TO_DATE(updated_at, "%d.%m.%Y %k:%i")
	;
-- 3 шаг: внесём изменения в структуру таблицы
ALTER TABLE users 
	MODIFY created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	MODIFY updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
	;
-- 4 шаг: проверка - добавление нового пользователя - дата/время создания должно отличаться от предыдущих
INSERT INTO users (name, birthday_at) 
	VALUES ('Геннадий', '1990-10-05');
