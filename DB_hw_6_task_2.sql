/*2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
*/
-- решение (рассуждение)
-- 1 шаг: посчитать общее количество лайков для каждого пользователя
SELECT count(*) AS number_of_likes,
		user_id -- нужно ограничение на user_id - пользователи, младше 10 лет
FROM likes
GROUP BY user_id -- если надо вывести количество лайков для каждого пользователя
ORDER BY number_of_likes DESC -- сортируем от максимального количества лайков к минимальному
;
-- 2 шаг: выделить пользователей младше 10 лет 
/*- возраст пользователя можно узнать из таблицы "профили" 
 * (выбрать из профилей с условием, где разность текущей даты и даты рождения меньше 10 --> точность вычисления возраста - до текущего месяца), 
 * "профили" связаны с "лайками" profiles.users_id-users.id-likes.user_id 
*/
SELECT user_id FROM profiles
	WHERE round((date_format(current_date, '%Y') - date_format(birthday, '%Y'))
				+(date_format(current_date, '%m') - date_format(birthday, '%m'))/12) < 10
;
-- выводит (2, 7, 17, 37, 45, 57, 63, 70, 78, 84, 85, 93, 94)
-- 3 шаг: связать лайки и пользователей, младше 10 

-- РЕШЕНИЕ:
SELECT count(*) AS number_of_likes FROM likes
	WHERE user_id IN(SELECT user_id FROM profiles
						WHERE round((date_format(current_date, '%Y') - date_format(birthday, '%Y'))
									+(date_format(current_date, '%m') - date_format(birthday, '%m'))/12) 
									< 10
									)
;