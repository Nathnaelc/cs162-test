/* Query: What are the details of the property with the highest sale price? */
SELECT "Query: What are the details of the property with the highest sale price?" AS query;
SELECT p.*
FROM Property p
JOIN Listing l ON p.property_id = l.property_id
JOIN Sale s ON l.listing_id = s.listing_id
WHERE s.sale_price = (SELECT MAX(sale_price) FROM Sale);
SELECT "" AS query;

/* Query: How many properties has each agent listed? */
SELECT "Query: How many properties has each agent listed?" AS query;
SELECT a.name AS agent_name, COUNT(l.listing_id) AS num_listings
FROM Agent a
LEFT JOIN Listing l ON a.agent_id = l.agent_id
GROUP BY a.name;
SELECT "" AS query;

/* Query: What is the average sale price of properties listed by Jane Smith? */
SELECT "Query: What is the average sale price of properties listed by Jane Smith?" AS query;
SELECT AVG(s.sale_price) AS average_sale_price
FROM Agent a
JOIN Listing l ON a.agent_id = l.agent_id
JOIN Sale s ON l.listing_id = s.listing_id
WHERE a.name = 'Jane Smith';
SELECT "" AS query;


/* Query: Who purchased a property on April 15, 2023, and what property did they buy? */
SELECT "Query: Who purchased a property on April 15, 2023, and what property did they buy?" AS query;
SELECT b.name AS buyer_name, p.address AS property_address
FROM Buyer b
JOIN Sale s ON b.buyer_id = s.buyer_id
JOIN Listing l ON s.listing_id = l.listing_id
JOIN Property p ON l.property_id = p.property_id
WHERE s.sale_date = '2023-04-15';
SELECT "" AS query;

/* Query: What is the total commission earned by each agent? */
SELECT "Query: What is the total commission earned by each agent?" AS query;
SELECT a.name AS agent_name, SUM(s.sale_price * 0.06) AS total_commission
FROM Agent a
JOIN Listing l ON a.agent_id = l.agent_id
JOIN Sale s ON l.listing_id = s.listing_id
GROUP BY a.name;
SELECT "" AS query;

/* Query: Who are the top-selling agents (by total sales amount), and what is their total sales amount? */
SELECT "Query: Who are the top-selling agents (by total sales amount), and what is their total sales amount?" AS query;
SELECT a.name AS agent_name, SUM(s.sale_price) AS total_sales_amount
FROM Agent a
JOIN Listing l ON a.agent_id = l.agent_id
JOIN Sale s ON l.listing_id = s.listing_id
GROUP BY a.name
ORDER BY total_sales_amount DESC;
SELECT "" AS query;

/* Query: What are the properties currently listed (not sold), and who are the corresponding agents? */
SELECT "Query: What are the properties currently listed (not sold), and who are the corresponding agents?" AS query;
SELECT p.address AS property_address, a.name AS agent_name
FROM Property p
JOIN Listing l ON p.property_id = l.property_id
JOIN Agent a ON l.agent_id = a.agent_id
WHERE l.listing_id NOT IN (SELECT listing_id FROM Sale);
SELECT "" AS query;

/* Query: Who are the buyers who have purchased multiple properties, and how many properties have they bought? */
SELECT "Query: Who are the buyers who have purchased multiple properties, and how many properties have they bought?" AS query;
SELECT b.name AS buyer_name, COUNT(DISTINCT s.listing_id) AS num_properties_purchased
FROM Buyer b
JOIN Sale s ON b.buyer_id = s.buyer_id
GROUP BY b.name
HAVING num_properties_purchased > 1;
SELECT "" AS query;

/* Query: What are the properties that have been listed for more than 30 days? */
SELECT "Query: What are the properties that have been listed for more than 30 days?" AS query;
SELECT p.address AS property_address, l.list_date
FROM Property p
JOIN Listing l ON p.property_id = l.property_id
WHERE l.list_date < DATE('now', '-30 days') AND l.listing_id NOT IN (SELECT listing_id FROM Sale);
SELECT "" AS query;
