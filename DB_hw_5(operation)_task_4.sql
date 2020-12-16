/*4. Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
* Месяцы заданы в виде списка английских названий (may, august)
*/
DROP DATABASE IF EXISTS  hw5;
CREATE DATABASE hw5;
USE hw5;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP, 
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
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
-- 1 способ - из исходной таблицы (без месяцев)
SELECT * FROM users 
	WHERE DATE_FORMAT(birthday_at, '%m') = 05 OR DATE_FORMAT(birthday_at, '%m') = 08 
;
-- 2 способ - с созданием колонки "месяцы" - месяцы заданы в виде списка английских названий (May, August)
-- 1 шаг: создать колонку месяцы в таблице пользователи 
ALTER TABLE users ADD `month` VARCHAR(15);
-- 2 шаг: проверить, выводятся ли месяцы пользователей функцией date_format() (можно опустить)
SELECT DATE_FORMAT(birthday_at, '%M') FROM users;
-- 3 шаг: заполнить колонку месяцы с помощью функции date_format()
UPDATE users 
	SET `month` = DATE_FORMAT(birthday_at, '%M'); 
-- 4 шаг: извлечь нужных пользователей
SELECT * FROM users 
	WHERE `month` = 'May' OR `month` = 'August' 
;
