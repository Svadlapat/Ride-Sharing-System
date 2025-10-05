"Main program to demonstrate the Ride Sharing System"
| driver1 driver2 rider1 rider2 ride1 ride2 ride3 ride4 |

"Create drivers"
driver1 := Driver new: "D001" name: "John Smith".
driver2 := Driver new: "D002" name: "Jane Doe".

"Create riders"
rider1 := Rider new: "R001" name: "Alice Brown".
rider2 := Rider new: "R002" name: "Bob Wilson".

"Create rides"
ride1 := StandardRide new: "SR001" pickup: "123 Main St" dropoff: "456 Oak Ave" distance: 5.5.
ride2 := PremiumRide new: "PR001" pickup: "789 Pine St" dropoff: "321 Elm St" distance: 3.2.
ride3 := StandardRide new: "SR002" pickup: "555 Park Ave" dropoff: "777 Lake St" distance: 4.8.
ride4 := PremiumRide new: "PR002" pickup: "999 Hill Rd" dropoff: "888 Valley Dr" distance: 7.1.

"Assign rides to drivers and riders"
driver1 addRide: ride1.
driver1 addRide: ride2.
driver2 addRide: ride3.
driver2 addRide: ride4.

rider1 requestRide: ride1.
rider1 requestRide: ride2.
rider2 requestRide: ride3.
rider2 requestRide: ride4.

"Update driver ratings"
driver1 updateRating: 4.5.
driver2 updateRating: 4.8.

"Display driver information"
Transcript show: "=== Driver Information ==="; cr.
Transcript show: driver1 driverInfo; cr.
Transcript show: driver2 driverInfo; cr.

"Display rider information"
Transcript show: "=== Rider Information ==="; cr.
Transcript show: rider1 viewRides; cr.
Transcript show: rider2 viewRides; cr.
