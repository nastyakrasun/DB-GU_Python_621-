/*1. Подсчитайте средний возраст пользователей в таблице users.
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
/* COUNT(id) - сколько всего человек в таблице
* (YEAR(CURRENT_DATE)-YEAR(`birthday_at`)) - вычисление возраста каждого 
* SUM((YEAR(CURRENT_DATE)-YEAR(`birthday_at`))) - сумма возрастов всех человек в таблице
*/
SELECT SUM((YEAR(CURRENT_DATE)-YEAR(birthday_at))) / COUNT(id) AS average_age FROM users;
