
select * from bookingcopy;

	-- Retrive all successfull booking

create view successfull_booking as
select * from bookingcopy
where Booking_Status='Success';

	-- Average Distance for each Vehicle Type

create view distance_for_each_vehicles as
select vehicle_type,AVG(Ride_distance)
from bookingcopy
group by Vehicle_Type;

	-- Total number of cancelled rides by Customer

create view total_cancel_rides_customer as
select count(booking_status)
from bookingcopy
where booking_status = 'canceled by Customer';

	-- Top 5 customers who booked highest number of rides

create view top_5_highest_rides_by_customer as
select customer_id, count(booking_id) from bookingcopy
group by Customer_ID order by count(Booking_ID) desc limit 5;

	--  Number of rides cancelled by drivers due to personal and car-related issues

create view rides_cancelled_by_derivers as
select count(*) from bookingcopy
where  Canceled_Rides_by_Driver= 'Personal & Car related issue';

	--  Maximum and minimum driver ratings for Prime Sedan bookings

create view max_min_driver_rating_for_sedan as
select max(driver_ratings),min(driver_ratings) from bookingcopy
where Vehicle_Type = 'Prime Sedan';

	-- All rides where payment was made using UPI:

create view payment_upi as
select * from bookingcopy
where Payment_Method = 'UPI';

	--  Average customer rating per vehicle type:

create view avg_customer_rating_vehicle_type as
select avg(Customer_Rating),Vehicle_Type from bookingcopy
group by Vehicle_Type;

	-- The total booking value of rides completed successfully

create view total_bookingvalue_rides_sucessfully as
select sum(Booking_Value) from bookingcopy
where Booking_Status='Success';

	-- All incomplete rides along with the reason

create view all_incompleterides_with_reason as 
select * from bookingcopy
where Incomplete_Rides = 'Yes';

