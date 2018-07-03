/*1. Select a distinct list of ordered airports codes. Be sure to name the column correctly. Be sure to order the results correctly.
Remember: TO ANSWER ANY GIVEN CHALLENGE CORRECTLY YOU MUST MATCH THE OUTPUT EXACTLY INCLUDING COLUMN NAMES, ROW CONTENT AND ORDER.*/

SELECT distinct departAirport as Airports from flight ORDER BY Airports asc;


/*
2. Provide a list of flights with a delayed status that depart from San Francisco (SFO).*/

SELECT a.name, f.flightNumber, f.scheduledDepartDateTime, f.arriveAirport, f.status from airline a inner join flight f on a.ID = f.airlineID where f.status = 'delayed' and f.departAirport = 'SFO';


/*
3. Provide a distinct list of cities that American Airlines departs from.*/



/*
4. Provide a distinct list of airlines that conducts flights departing from ATL.*/


/*
5. Provide a list of airlines, flight numbers, departing airports, and arrival airports where flights departed on time.*/




/*
6. Provide a list of airlines, flight numbers, gates, status, and arrival times arriving into Charlotte (CLT) on 10-30-2017. Order your results by the arrival time.*/



/*
7. List the number of reservations by flight number. Order by reservations in descending order.*/



/*
8. List the average ticket cost for coach by airline and route. Order by AverageCost in descending order.*/



/*
9. Which route is the longest?*/





/*
10. List the top 5 passengers that have flown the most miles. Order by miles.*/



/*
11. Provide a list of American airline flights ordered by route and arrival date and time. */




/*
Provide a report that counts the number of reservations and totals the reservation costs (as Revenue) by Airline, flight, and route. Order the report by total revenue in descending order.*/


/*
13. List the average cost per reservation by route. Round results down to the dollar.*/




/*
14. List the average miles per flight by airline.*/





/*
15. Which airlines had flights that arrived early?*/