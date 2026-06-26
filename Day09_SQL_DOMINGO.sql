-- 9. Customers who placed 8 or more orders. (HAVING)
SELECT customer_name,
    COUNT(customer_id) AS cust_id
FROM sales
GROUP BY customer_name
HAVING cust_id >= 8;
--Result:
-- Carlos Garcia| 10
--Grace Domingo| 14
--Joy Bautista| 8
-- 10. Products that sold MORE than 50 total units. (HAVING)
SELECT product,
    SUM(quantity) total_units_sold
FROM sales
GROUP BY product
HAVING total_units_sold > 50;
--Result:
-- none
-- 11. Customers whose total spend is above the average customer spend. (Subquery)
SELECT customer_name,
    SUM(total) AS total_spent
FROM sales
GROUP BY customer_name
HAVING SUM(total) > (
        SELECT AVG(customer_total)
        FROM (
                SELECT SUM(total) AS customer_total
                FROM sales
                GROUP BY customer_name
            ) AS Subquery_alias
    );
--Result:
-- Carlos Garcia | 235980
--Joy Bautista| 168390
--Leo Pascual| 124800