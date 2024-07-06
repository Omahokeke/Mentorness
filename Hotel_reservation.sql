-- 1. What is the total number of reservations in the dataset?
SELECT COUNT(*) AS total_reservation
FROM `data-analytics-409012.Hotel_Reservation.hotel_reservation`;

-- 2. Which meal plan is the most popular among guests?
SELECT type_of_meal_plan, COUNT(*) AS meal_plan_count
FROM `data-analytics-409012.Hotel_Reservation.hotel_reservation`
GROUP BY type_of_meal_plan
ORDER BY meal_plan_count DESC
LIMIT 1;

-- 3. What is the average price per room for reservations involving children?
SELECT AVG(avg_price_per_room) AS average_price
FROM `data-analytics-409012.Hotel_Reservation.hotel_reservation`
WHERE no_of_children > 0;

-- 4. How many reservations were made for the year 2018?
SELECT COUNT(*) AS reservations_in_2018
FROM `data-analytics-409012.Hotel_Reservation.hotel_reservation`
WHERE EXTRACT(YEAR FROM arrival_date) = 2018;

-- 5. What is the most commonly booked room type?
SELECT room_type_reserved, COUNT(room_type_reserved) AS booking_count
FROM `data-analytics-409012.Hotel_Reservation.hotel_reservation`
GROUP BY room_type_reserved
ORDER BY booking_count DESC
LIMIT 1;

-- 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?
SELECT COUNT(*) AS weekend_reservations
FROM `data-analytics-409012.Hotel_Reservation.hotel_reservation`
WHERE no_of_weekend_nights > 0;

-- 7. What is the highest and lowest lead time for reservations?
SELECT MAX(lead_time) AS highest_lead_time, MIN(lead_time) AS lowest_lead_time
FROM `data-analytics-409012.Hotel_Reservation.hotel_reservation`;

-- 8. What is the most common market segment type for reservations?
SELECT market_segment_type, COUNT(market_segment_type) AS segment_count
FROM `data-analytics-409012.Hotel_Reservation.hotel_reservation`
GROUP BY market_segment_type
ORDER BY segment_count DESC
LIMIT 1;

-- 9. How many reservations have a booking status of "Confirmed"?
SELECT COUNT(*) AS confirmed_reservations
FROM `data-analytics-409012.Hotel_Reservation.hotel_reservation`
WHERE booking_status = 'Confirmed';

-- 10. What is the total number of adults and children across all reservations?
SELECT SUM(no_of_adults) AS total_adults, SUM(no_of_children) AS total_children
FROM `data-analytics-409012.Hotel_Reservation.hotel_reservation`;

-- 12. How many reservations were made in each month of the year?
SELECT EXTRACT(MONTH FROM arrival_date) AS month, COUNT(*) AS reservations_count
FROM `data-analytics-409012.Hotel_Reservation.hotel_reservation`
GROUP BY month
ORDER BY month;

-- 11. What is the average number of weekend nights for reservations involving children?
SELECT AVG(no_of_weekend_nights) AS avg_weekend_nights_with_children
FROM `data-analytics-409012.Hotel_Reservation.hotel_reservation`
WHERE no_of_children > 0;

-- 13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?
SELECT room_type_reserved, AVG(no_of_weekend_nights + no_of_week_nights) AS avg_total_nights
FROM `data-analytics-409012.Hotel_Reservation.hotel_reservation`
GROUP BY room_type_reserved;

-- 14. For reservations involving children, what is the most common room type, and what is the average price for that room type?
SELECT room_type_reserved, COUNT(room_type_reserved) AS count
FROM `data-analytics-409012.Hotel_Reservation.hotel_reservation`
WHERE no_of_children > 0
GROUP BY room_type_reserved
ORDER BY count DESC
LIMIT 1;

-- Get the average price for the most common room type involving children
SELECT AVG(avg_price_per_room) AS avg_price
FROM `data-analytics-409012.Hotel_Reservation.hotel_reservation`
WHERE no_of_children > 0 AND room_type_reserved = 'Room_Type 1';

-- 15. Find the market segment type that generates the highest average price per room.
SELECT market_segment_type, AVG(avg_price_per_room) AS avg_price
FROM `data-analytics-409012.Hotel_Reservation.hotel_reservation`
GROUP BY market_segment_type
ORDER BY avg_price DESC
LIMIT 1;