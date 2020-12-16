/* 2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
 * Следует учесть, что необходимы дни недели текущего года, а не года рождения.
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
		('Мария', '1992-08-29'),
		('Геннадий', '1990-12-07'),
		('Наталья', '1984-10-12'),
		('Александр', '1985-03-20'),
		('Сергей', '1988-08-14'),
		('Иван', '1998-04-12'),
		('Мария', '1992-02-29')
	;

-- решение
SELECT DAYNAME(DATE_FORMAT(birthday_at, '2020.%m.%d')) AS this_year_birthdays FROM users;

ALTER TABLE users ADD this_year_birthdays VARCHAR(15);
UPDATE users 
	SET this_year_birthdays = DAYNAME(DATE_FORMAT(birthday_at, '2020.%m.%d')); 

SELECT this_year_birthdays, COUNT(*) FROM users GROUP BY this_year_birthdays ORDER BY COUNT(*) DESC; -- результат по дням недели от большего количества к меньшему