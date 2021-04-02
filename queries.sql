-- write your queries here
-- 1 Join the two tables so that every column and record appears, regardless of if there is not an owner_id.
SELECT * FROM owners LEFT JOIN vehicles On vehicles.owner_id = owners.id;

-- 2 Count the number of cars for each owner. Display the owners first_name, last_name and count of vehicles. 
--   The first_name should be ordered in ascending order.
SELECT o.first_name, o.last_name,count(*) FROM owners o JOIN vehicles v ON v.owner_id = o.id GROUP BY o.id ORDER BY first_name;

--3 Count the number of cars for each owner and display the average price for each of the cars as integers. 
--  Display the owners first_name, last_name, average price and count of vehicles. The first_name should be ordered in descending order. 
--  Only display results with more than one vehicle and an average price greater than 10000. 
SELECT o.first_name,o.last_name,ROUND(SUM(v.price)/count(*)) as average_price,count(*) FROM owners o
JOIN vehicles v ON v.owner_id = o.id GROUP BY o.id HAVING ROUND(SUM(v.price)/count(*)) > 10000 ORDER BY o.first_name desc;

