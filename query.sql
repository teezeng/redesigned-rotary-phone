SELECT 
  r.route_no,
  r.departure_airport,
  r.arrival_airport,
  a.airport_name->>'ru' as departure_airport_name,
  f.actual_arrival
FROM routes as r
JOIN airports_data as a 
    ON a.airport_code = r.departure_airport
JOIN flights as f
    ON f.route_no = r.route_no
WHERE status = 'Arrived'
ORDER BY f.actual_arrival DESC
LIMIT 20;
