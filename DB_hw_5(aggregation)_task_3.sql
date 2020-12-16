/* 3. Подсчитайте произведение чисел в столбце таблицы.
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
-- решение - на примере столбцов таблицы storehouses_products 
/*(доказательство - мат.анализ - логарифм произведения равен сумме логарифмов, 
 * дифференцирование - процесс, обратный логарифмированию. 
 * всё делаем (логарифмируем, диффиренцируем) относительно числа е)
 */ 
SELECT EXP(SUM(ln(storehouse_id))) FROM storehouses_products;
SELECT EXP(SUM(ln(product_id))) FROM storehouses_products;
SELECT EXP(SUM(ln(value))) FROM storehouses_products;