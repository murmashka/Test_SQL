/*Задание 1. Выведите для каждого покупателя его адрес, город и страну проживания.*/
select c.first_name, a.address, c2.city, c3.country  from customer c  inner join address a on a.address_id=c.address_id inner join city c2 on c2.city_id=a.city_id inner join country c3 on c3.country_id=c2.country_id 


/*Задание 3. Выведите топ-5 покупателей, которые взяли в аренду за всё время наибольшее количество фильмов.*/
select * from (select r.customer_id as "ID customer", count(*) as "quantity"  from rental r  group by r.customer_id) as Table1 order by Table1.quantity desc limit 5