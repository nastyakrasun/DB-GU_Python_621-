/*3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 
* 0, если товар закончился и выше нуля, если на складе имеются запасы. 
* Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. 
* Однако нулевые запасы должны выводиться в конце, после всех записей.
*/
DROP DATABASE IF EXISTS  hw5;
CREATE DATABASE hw5;
USE hw5;

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
    storehouse_id INT UNSIGNED,
    product_id INT UNSIGNED,
    value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата регистрации',
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Дата последнего обновления записи'
) COMMENT = 'Склады и продукты';

INSERT INTO storehouses_products (storehouse_id, product_id, value) 
	VALUES
		(1, 1, 0),
		(1, 2, 4),
		(1, 3, 0),
		(2, 4, 7),
		(2, 5, 56),
		(1, 6, 0),
		(1, 7, 4)
	;
    
-- решение
SELECT * FROM storehouses_products
	ORDER BY 
		CASE WHEN value = 0 
			THEN 100500
		ELSE value 
	END;