*Задание 1. Выведите уникальные названия городов из таблицы городов.*/
select distinct city from city
/*Задание 2. Доработайте запрос из предыдущего задания, чтобы запрос выводил только те города, названия которых начинаются на “L” и заканчиваются на “a”, и названия не содержат пробелов.*/
select distinct city from city where city like 'L%' and city like '%a' and city not like '% %'
/*Задание 3. Получите из таблицы платежей за прокат фильмов информацию по платежам, которые выполнялись в промежуток с 17 июня 2005 года по 19 июня 2005 года включительно и стоимость которых превышает 1.00. Платежи нужно отсортировать по дате платежа.*/
select * from payment where amount>1 and payment_date>= '2005-06-17' AND payment_date <='2005-06-19' order by payment_date
/*Задание 5. Выведите следующую информацию по покупателям:
•	Фамилия и имя (в одной колонке через пробел)
•	Электронная почта
•	Длину значения поля email
•	Дату последнего обновления записи о покупателе (без времени)
Каждой колонке задайте наименование на русском языке*/
select concat(first_name,' ',last_name) as "ФИО",email as "Почта", LENGTH(email) as "Кол-во символов в email", date(last_update) as "Дата обновления" from customer
/*Задание 6. Выведите одним запросом только активных покупателей, имена которых KELLY или WILLIE. Все буквы в фамилии и имени из верхнего регистра должны быть переведены в нижний регистр.*/
select LOWER(concat(first_name,' ',last_name)) as "Name" from customer where activebool=true and (first_name='KELLY' or first_name='WILLIE')
/*Задание 7. Выведите одним запросом информацию о фильмах, у которых рейтинг “R” и стоимость аренды указана от 0.00 до 3.00 включительно, а также фильмы c рейтингом “PG-13” и стоимостью аренды больше или равной 4.00.*/
select title from film where (rating ='R' and rental_rate>=0.00 and rental_rate<=3.00) or (rating ='PG-13' and rental_rate>=4.00)
/*Задание 9. Выведите Email каждого покупателя, разделив значение Email на 2 отдельных колонки:
•	в первой колонке должно быть значение, указанное до @,
•	во второй колонке должно быть значение, указанное после @.
*/
select SUBSTRING(email, 1, strpos(email,'@')-1) AS "До @",SUBSTRING(email, strpos(email,'@')+1, LENGTH(email)) as "После @" from customer
/*Задание 10. Доработайте запрос из предыдущего задания, скорректируйте значения в новых колонках: первая буква должна быть заглавной, остальные строчными.*/
select concat(upper (substring(SUBSTRING(email, 1, strpos(email,'@')-1),1,1)), lower(substring(SUBSTRING(email, 1, strpos(email,'@')-1),2))) as "До @", concat(upper (substring(SUBSTRING(email, strpos(email,'@')+1, LENGTH(email)),1,1)), lower(substring(SUBSTRING(email, strpos(email,'@')+1, LENGTH(email)),2))) as "После @" from customer
