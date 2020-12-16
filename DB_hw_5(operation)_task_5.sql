/*5. Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs WHERE id IN (5, 1, 2); 
 * Отсортируйте записи в порядке, заданном в списке IN.
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
-- нет таблицы catalogs, пользуюсь users
SELECT * FROM users WHERE id IN (5, 1, 2)
ORDER BY CASE
WHEN id = 5 THEN 0
WHEN id = 1 THEN 1
WHEN id = 2 THEN 2
END;