/*1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
*/
DROP DATABASE IF EXISTS  hw5;
CREATE DATABASE hw5;
USE hw5;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME, 
  updated_at DATETIME 
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at) 
	VALUES 
		('Геннадий', '1990-10-07'),
		('Наталья', '1984-11-12'),
		('Александр', '1985-05-20'),
		('Сергей', '1988-02-14'),
		('Иван', '1998-01-12'),
		('Мария', '1992-08-29')
	;

-- решение
-- 1 шаг: изменение в структуру таблицы 
ALTER TABLE users 
	MODIFY created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	MODIFY updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
	;
-- 2 шаг: обновление столбцов created_at, updated_at у имеющихся данных
UPDATE users 
	SET created_at = NOW(); 
-- 3 шаг: проверка - добавление нового пользователя - дата/время создания должно отличаться от предыдущих
INSERT INTO users (name, birthday_at) 
	VALUES ('Геннадий', '1990-10-05');
