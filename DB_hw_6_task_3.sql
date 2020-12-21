/*3. Определить кто больше поставил лайков (всего): мужчины или женщины.
*/
-- ход решения
-- количество лайков считаем в таблице "лайки"
-- пол указан в таблице "профили" - gender 
-- "профили" и "лайки" сравниваем с помощью case when then
-- количество лайков от мужчин
SELECT count(*) AS men_likes FROM likes
	WHERE user_id IN(
		SELECT user_id FROM profiles 
			WHERE gender = 'm'
			)
UNION -- !объединяем ! для решения нужно сравнивать, а не объединять
-- количество лайков от женщин
SELECT count(*) AS women_likes FROM likes
	WHERE user_id IN(
		SELECT user_id FROM profiles 
			WHERE gender = 'f'
			) 
;
-- РЕШЕНИЕ
SELECT 
	CASE 
		WHEN 
			((SELECT count(*) AS men_likes FROM likes
				WHERE user_id IN(
					SELECT user_id FROM profiles 
						WHERE gender = 'm')) 
			> 
			 (SELECT count(*) AS women_likes FROM likes
				WHERE user_id IN(
					SELECT user_id FROM profiles 
						WHERE gender = 'f'))) 
		THEN 'мужчины'
		WHEN 
			((SELECT count(*) AS men_likes FROM likes
				WHERE user_id IN(
					SELECT user_id FROM profiles 
						WHERE gender = 'm')) 
			< 
			 (SELECT count(*) AS women_likes FROM likes
				WHERE user_id IN(
					SELECT user_id FROM profiles 
						WHERE gender = 'f')))
		THEN 'женщины'
		ELSE 'одинаково'
	END
;