"Main program to demonstrate the Ride Sharing System"
| driver1 driver2 rider1 rider2 ride1 ride2 ride3 ride4 |

"Create drivers"
driver1 := Driver new: 'D001' name: 'John Smith'.
driver2 := Driver new: 'D002' name: 'Jane Doe'.

"Create riders"
rider1 := Rider new: 'R001' name: 'Alice Brown'.
rider2 := Rider new: 'R002' name: 'Bob Wilson'.

"Create rides"
ride1 := StandardRide new: 'SR001' pickup: '123 Main St' dropoff: '456 Oak Ave' distance: 5.5.
ride2 := PremiumRide new: 'PR001' pickup: '789 Pine St' dropoff: '321 Elm St' distance: 3.2.
ride3 := StandardRide new: 'SR002' pickup: '555 Park Ave' dropoff: '777 Lake St' distance: 4.8.
ride4 := PremiumRide new: 'PR002' pickup: '999 Hill Rd' dropoff: '888 Valley Dr' distance: 7.1.

"Assign rides to drivers and riders"
driver1 addRide: ride1; addRide: ride2.
driver2 addRide: ride3; addRide: ride4.

rider1 requestRide: ride1; requestRide: ride4.
rider2 requestRide: ride2; requestRide: ride3.

"Update driver ratings"
driver1 updateRating: 4.8.
driver2 updateRating: 4.9.

"Display system information"
Transcript
    show: '=== Driver Information ==='; cr;
    show: driver1 driverInfo asString; cr;
    show: driver2 driverInfo asString; cr;
    cr;
    show: '=== Rider Information ==='; cr;
    show: rider1 riderInfo asString; cr;
    show: rider2 riderInfo asString; cr;
    cr;
    show: '=== Ride Information ==='; cr;
    show: ride1 rideInfo asString; cr;
    show: ride2 rideInfo asString; cr;
    show: ride3 rideInfo asString; cr;
    show: ride4 rideInfo asString; cr;
    flush.