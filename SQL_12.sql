--film tablosunda film uzunluğu length sütununda gösterilmektedir. Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?
SELECT COUNT(*) FROM film
WHERE length>
(
	SELECT AVG(length) FROM film
);



--film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?
SELECT COUNT(*) FROM film
WHERE rental_rate=(
	SELECT MAX(rental_rate) FROM film
);



--film tablosunda en düşük rental_rate ve en düşün replacement_cost değerlerine sahip filmleri sıralayınız.
SELECT title , (SELECT MIN(rental_rate) FROM film), (SELECT MIN(replacement_cost) FROM film) FROM film;



--payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.
SELECT customer_id
FROM payment
GROUP BY customer_id
HAVING SUM(amount) = (
	SELECT MAX(sum_amount)
    FROM (
		SELECT SUM(amount) AS sum_amount FROM payment
		GROUP BY customer_id
		)
);




