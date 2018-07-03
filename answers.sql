/*1. Select a distinct list of ordered airports codes. Be sure to name the column correctly. Be sure to order the results correctly.
Remember: TO ANSWER ANY GIVEN CHALLENGE CORRECTLY YOU MUST MATCH THE OUTPUT EXACTLY INCLUDING COLUMN NAMES, ROW CONTENT AND ORDER.*/

SELECT distinct departAirport as Airports from flight ORDER BY Airports asc;


/*
2. Provide a list of flights with a delayed status that depart from San Francisco (SFO).*/

SELECT a.name, f.flightNumber, f.scheduledDepartDateTime, f.arriveAirport, f.status from airline a inner join flight f on a.ID = f.airlineID where f.status = 'delayed' and f.departAirport = 'SFO';


/*
3. Provide a distinct list of cities that American Airlines departs from.*/

SELECT distinct f.departAirport as Cities from flight f join airline a on f.airlineID = a.ID where a.name = 'American';


/*
4. Provide a distinct list of airlines that conducts flights departing from ATL.*/

SELECT distinct a.name as Airline from airline a join flight f on a.ID = f.airlineID where f.departAirport = 'ATL';


/*
5. Provide a list of airlines, flight numbers, departing airports, and arrival airports where flights departed on time.*/

SELECT a.name, f.flightNumber, f.departAirport, f.arriveAirport from airline a inner join flight f on a.ID = f.airlineID WHERE subtime(time(f.scheduledDepartDateTime), time(f.actualDepartDateTime)) = 0;


/*
6. Provide a list of airlines, flight numbers, gates, status, and arrival times arriving into Charlotte (CLT) on 10-30-2017. Order your results by the arrival time.*/

SELECT a.name as Airline, f.flightNumber as Flight, f.gate as Gate, Time(f.scheduledArriveDateTime) as Arrival, f.status as Status from airline a join flight f on a.ID = f.airlineID where f.arriveAirport = 'CLT' and Day(Date(f.scheduledArriveDateTime)) = 30 Order by Arrival;

/*
7. List the number of reservations by flight number. Order by reservations in descending order.*/

SELECT f.flightNumber as flight, count(r.flightID) as reservations from flight f join reservation r on f.ID = r.flightID GROUP BY f.flightNumber ORDER BY reservations desc;


/*
8. List the average ticket cost for coach by airline and route. Order by AverageCost in descending order.*/

SELECT a.name as airline, f.departAirport, f.arriveAirport, AVG(r.cost) as AverageCost from reservation r inner join flight f on r.flightID = f.ID inner join airline a on f.airlineID = a.ID where r.class = 'coach' group by airline, f.ID ORDER BY AverageCost desc;


/*
9. Which route is the longest?*/

SELECT departAirport, arriveAirport, miles from flight group by id order by miles desc limit 1;


/*
10. List the top 5 passengers that have flown the most miles. Order by miles.*/

SELECT p.firstName, p.lastName, sum(f.miles) as miles from flight f inner join reservation r on f.ID = r.flightID inner join passenger p on r.passengerID = p.ID group by r.passengerID order by miles desc, p.firstName asc limit 5;


/*
11. Provide a list of American airline flights ordered by route and arrival date and time. */

SELECT a.name as Name, concat(f.departAirport, ' --> ', f.arriveAirport) as Route, Date(f.scheduledArriveDateTime) as 'Arrival Date', Time(f.scheduledArriveDateTime) as 'Arrival Time' from airline a inner join flight f on a.ID = f.airlineID where Name = 'American' Group by f.ID ORDER by Route, Date(f.scheduledArriveDateTime), Time(f.scheduledArriveDateTime);, 



/*
12. Provide a report that counts the number of reservations and totals the reservation costs (as Revenue) by Airline, flight, and route. Order the report by total revenue in descending order.*/

SELECT a.name as Airline, f.flightNumber as Flight, concat(f.departAirport, ' --> ', f.arriveAirport) as Route, count(r.flightID) as 'Reservation Count', sum(r.cost) as Revenue from reservation r inner join flight f on r.flightID = f.ID inner join airline a on f.airlineID = a.ID group by Airline, Flight, Route Order by Revenue desc;


/*
13. List the average cost per reservation by route. Round results down to the dollar.*/

SELECT concat(f.departAirport, ' --> ', f.arriveAirport) as Route, Floor(AVG(r.cost)) as 'Avg Revenue' from flight f inner join reservation r on f.ID = r.flightID GROUP by Route Order by AVG(r.cost) desc;


/*
14. List the average miles per flight by airline.*/

SELECT a.name as Airline, AVG(f.miles) as 'Avg Miles Per Flight' from airline a join flight f on a.ID = f.airlineID GROUP BY Airline;


/*
15. Which airlines had flights that arrived early?*/

SELECT a.name as Airline from airline a inner join flight f on a.ID = f.airlineID where TIMEDIFF(Time(scheduledArriveDateTime), Time(actualArriveDateTime)) > 0 group by Airline;
