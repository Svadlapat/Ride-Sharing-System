Object subclass: #RideObject subclass: #Ride

    instanceVariableNames: 'rideID pickupLocation dropoffLocation distance'    instanceVariableNames: 'rideID pickupLocation dropoffLocation distance'

    classVariableNames: ''    classVariableNames: ''

    poolDictionaries: ''    poolDictionaries: ''

    category: 'RideSharingSystem'!    category: 'RideSharingSystem'!



!Ride class methodsFor: 'instance creation'!!Ride class methodsFor: 'instance creation'!

new: id pickup: pickup dropoff: dropoff distance: distnew: id pickup: pickup dropoff: dropoff distance: dist

    ^(super new)    ^(super new)

        initializeWithID: id pickup: pickup dropoff: dropoff distance: dist;        initializeWithID: id pickup: pickup dropoff: dropoff distance: dist;

        yourself        yourself

!!!!



!Ride methodsFor: 'initialization'!!Ride methodsFor: 'initialization'!

initializeWithID: id pickup: pickup dropoff: dropoff distance: distinitializeWithID: id pickup: pickup dropoff: dropoff distance: dist

    rideID := id.    rideID := id.

    pickupLocation := pickup.    pickupLocation := pickup.

    dropoffLocation := dropoff.    dropoffLocation := dropoff.

    distance := dist.    distance := dist.

    ^self    ^self

!!!!



!Ride methodsFor: 'accessing'!!Ride methodsFor: 'accessing'!

rideIDrideID

    ^rideID    ^rideID

!!!!



distancedistance

    ^distance    ^distance

!!!!



pickupLocationpickupLocation

    ^pickupLocation    ^pickupLocation

!!!!



dropoffLocationdropoffLocation

    ^dropoffLocation    ^dropoffLocation

!!!!



farefare

    ^self calculateFare    ^self calculateFare

!!!!



!Ride methodsFor: 'operations'!!Ride methodsFor: 'operations'!

calculateFarecalculateFare

    self subclassResponsibility    self subclassResponsibility

!!!!



!Ride methodsFor: 'printing'!!Ride methodsFor: 'printing'!

rideInforideInfo

    | str |    | str |

    str := 'Ride ID: ', rideID printString, (Character nl asString),    str := 'Ride ID: ', rideID printString, String nl,

           'Pickup: ', pickupLocation printString, (Character nl asString),           'Pickup: ', pickupLocation printString, String nl,

           'Dropoff: ', dropoffLocation printString, (Character nl asString),           'Dropoff: ', dropoffLocation printString, String nl,

           'Distance: ', distance printString, ' miles', (Character nl asString),           'Distance: ', distance printString, ' miles', String nl,

           'Fare: $', self calculateFare printString, (Character nl asString).           'Fare: $', self calculateFare printString, String nl.

    ^str    ^str

!!!!



Ride subclass: #StandardRideRide subclass: #StandardRide

    instanceVariableNames: ''    instanceVariableNames: ''

    classVariableNames: ''    classVariableNames: ''

    poolDictionaries: ''    poolDictionaries: ''

    category: 'RideSharingSystem'!    category: 'RideSharingSystem'!



!StandardRide methodsFor: 'operations'!!StandardRide methodsFor: 'operations'!

calculateFarecalculateFare

    "Base rate of $5 plus $2 per kilometer"    "Base rate of $5 plus $2 per kilometer"

    ^5.0 + (2.0 * distance)    ^5.0 + (2.0 * distance)

!!!!



Ride subclass: #PremiumRideRide subclass: #PremiumRide

    instanceVariableNames: ''    instanceVariableNames: ''

    classVariableNames: ''    classVariableNames: ''

    poolDictionaries: ''    poolDictionaries: ''

    category: 'RideSharingSystem'!    category: 'RideSharingSystem'!



!PremiumRide methodsFor: 'operations'!!PremiumRide methodsFor: 'operations'!

calculateFarecalculateFare

    "Base rate of $10 plus $3 per kilometer"    "Base rate of $10 plus $3 per kilometer"

    ^10.0 + (3.0 * distance)    ^10.0 + (3.0 * distance)

!!!!



Object subclass: #DriverObject subclass: #Driver

    instanceVariableNames: 'driverID name rating assignedRides'    instanceVariableNames: 'driverID name rating assignedRides'

    classVariableNames: ''    classVariableNames: ''

    poolDictionaries: ''    poolDictionaries: ''

    category: 'RideSharingSystem'!    category: 'RideSharingSystem'!



!Driver class methodsFor: 'instance creation'!!Driver class methodsFor: 'instance creation'!

new: id name: driverNamenew: id name: driverName

    ^(super new)    ^(super new)

        initializeWithID: id name: driverName;        initializeWithID: id name: driverName;

        yourself        yourself

!!!!



!Driver methodsFor: 'initialization'!!Driver methodsFor: 'initialization'!

initializeWithID: id name: driverNameinitializeWithID: id name: driverName

    driverID := id.    driverID := id.

    name := driverName.    name := driverName.

    rating := 5.0.    rating := 5.0.

    assignedRides := Array new: 0.    assignedRides := Array new: 0.

    ^self    ^self

!!!!



!Driver methodsFor: 'accessing'!!Driver methodsFor: 'accessing'!

driverIDdriverID

    ^driverID    ^driverID

!!!!



namename

    ^name    ^name

!!!!



ratingrating

    ^rating    ^rating

!!!!



!Driver methodsFor: 'operations'!!Driver methodsFor: 'operations'!

addRide: aRideaddRide: aRide

    assignedRides := assignedRides copyWith: aRide    assignedRides := assignedRides copyWith: aRide

!!!!



calculateTotalEarningscalculateTotalEarnings

    | sum |    | sum |

    sum := 0.    sum := 0.

    1 to: assignedRides size do: [:i |    1 to: assignedRides size do: [:i |

        sum := sum + ((assignedRides at: i) calculateFare)].        sum := sum + ((assignedRides at: i) calculateFare)].

    ^sum    ^sum

!!!!



updateRating: newRatingupdateRating: newRating

    (newRating between: 0 and: 5) ifTrue: [    (newRating between: 0 and: 5) ifTrue: [

        rating := ((rating + newRating) / 2.0) asFloat]        rating := ((rating + newRating) / 2.0) asFloat]

!!!!



!Driver methodsFor: 'printing'!!Driver methodsFor: 'printing'!

driverInfodriverInfo

    | str |    | str |

    str := 'Driver ID: ', driverID printString, (Character nl asString),    str := 'Driver ID: ', driverID printString, String nl,

           'Name: ', name printString, (Character nl asString),           'Name: ', name printString, String nl,

           'Rating: ', rating printString, (Character nl asString),           'Rating: ', rating printString, String nl,

           'Total rides: ', assignedRides size printString, (Character nl asString),           'Total rides: ', assignedRides size printString, String nl,

           'Total earnings: $', self calculateTotalEarnings printString, (Character nl asString).           'Total earnings: $', self calculateTotalEarnings printString, String nl.

    ^str    ^str

!!!!



Object subclass: #RiderObject subclass: #Rider

    instanceVariableNames: 'riderID name requestedRides'    instanceVariableNames: 'riderID name requestedRides'

    classVariableNames: ''    classVariableNames: ''

    poolDictionaries: ''    poolDictionaries: ''

    category: 'RideSharingSystem'!    category: 'RideSharingSystem'!



!Rider class methodsFor: 'instance creation'!!Rider class methodsFor: 'instance creation'!

new: id name: riderNamenew: id name: riderName

    ^(super new)    ^(super new)

        initializeWithID: id name: riderName;        initializeWithID: id name: riderName;

        yourself        yourself

!!!!



!Rider methodsFor: 'initialization'!!Rider methodsFor: 'initialization'!

initializeWithID: id name: riderNameinitializeWithID: id name: riderName

    riderID := id.    riderID := id.

    name := riderName.    name := riderName.

    requestedRides := Array new: 0.    requestedRides := Array new: 0.

    ^self    ^self

!!!!



!Rider methodsFor: 'accessing'!!Rider methodsFor: 'accessing'!

riderIDriderID

    ^riderID    ^riderID

!!!!



namename

    ^name    ^name

!!!!



!Rider methodsFor: 'operations'!!Rider methodsFor: 'operations'!

requestRide: aRiderequestRide: aRide

    requestedRides := requestedRides copyWith: aRide    requestedRides := requestedRides copyWith: aRide

!!!!



calculateTotalSpentcalculateTotalSpent

    | sum |    | sum |

    sum := 0.    sum := 0.

    1 to: requestedRides size do: [:i |    1 to: requestedRides size do: [:i |

        sum := sum + ((requestedRides at: i) calculateFare)].        sum := sum + ((requestedRides at: i) calculateFare)].

    ^sum    ^sum

!!!!



!Rider methodsFor: 'printing'!!Rider methodsFor: 'printing'!

riderInforiderInfo

    | str |    | str |

    str := 'Rider ID: ', riderID printString, (Character nl asString),    str := 'Rider ID: ', riderID printString, String nl,

           'Name: ', name printString, (Character nl asString),           'Name: ', name printString, String nl,

           'Total rides: ', requestedRides size printString, (Character nl asString),           'Total rides: ', requestedRides size printString, String nl,

           'Total spent: $', self calculateTotalSpent printString, (Character nl asString).           'Total spent: $', self calculateTotalSpent printString, String nl.

    ^str    ^str

!!!!



"Main program to demonstrate the Ride Sharing System""Main program to demonstrate the Ride Sharing System"



"Create drivers""Create drivers"

driver1 := Driver new: 'D001' name: 'John Smith'.driver1 := Driver new: 'D001' name: 'John Smith'.

driver2 := Driver new: 'D002' name: 'Jane Doe'.driver2 := Driver new: 'D002' name: 'Jane Doe'.



"Create riders""Create riders"

rider1 := Rider new: 'R001' name: 'Alice Brown'.rider1 := Rider new: 'R001' name: 'Alice Brown'.

rider2 := Rider new: 'R002' name: 'Bob Wilson'.rider2 := Rider new: 'R002' name: 'Bob Wilson'.



"Create rides""Create rides"

ride1 := StandardRide new: 'SR001' pickup: '123 Main St' dropoff: '456 Oak Ave' distance: 5.5.ride1 := StandardRide new: 'SR001' pickup: '123 Main St' dropoff: '456 Oak Ave' distance: 5.5.

ride2 := PremiumRide new: 'PR001' pickup: '789 Pine St' dropoff: '321 Elm St' distance: 3.2.ride2 := PremiumRide new: 'PR001' pickup: '789 Pine St' dropoff: '321 Elm St' distance: 3.2.

ride3 := StandardRide new: 'SR002' pickup: '555 Park Ave' dropoff: '777 Lake St' distance: 4.8.ride3 := StandardRide new: 'SR002' pickup: '555 Park Ave' dropoff: '777 Lake St' distance: 4.8.

ride4 := PremiumRide new: 'PR002' pickup: '999 Hill Rd' dropoff: '888 Valley Dr' distance: 7.1.ride4 := PremiumRide new: 'PR002' pickup: '999 Hill Rd' dropoff: '888 Valley Dr' distance: 7.1.



"Assign rides to drivers and riders""Assign rides to drivers and riders"

driver1 addRide: ride1; addRide: ride2.driver1 addRide: ride1; addRide: ride2.

driver2 addRide: ride3; addRide: ride4.driver2 addRide: ride3; addRide: ride4.



rider1 requestRide: ride1; requestRide: ride4.rider1 requestRide: ride1; requestRide: ride4.

rider2 requestRide: ride2; requestRide: ride3.rider2 requestRide: ride2; requestRide: ride3.



"Update driver ratings""Update driver ratings"

driver1 updateRating: 4.8.driver1 updateRating: 4.8.

driver2 updateRating: 4.9.driver2 updateRating: 4.9.



"Display system information""Display system information"

Transcript show: '=== Driver Information ==='; cr.Transcript show: '=== Driver Information ==='; nl.

Transcript show: driver1 driverInfo; cr.Transcript show: driver1 driverInfo.

Transcript show: driver2 driverInfo; cr.Transcript show: driver2 driverInfo.

Transcript nl.

Transcript show: '=== Rider Information ==='; cr.

Transcript show: rider1 riderInfo; cr.Transcript show: '=== Rider Information ==='; nl.

Transcript show: rider2 riderInfo; cr.Transcript show: rider1 riderInfo.

Transcript show: rider2 riderInfo.

Transcript show: '=== Ride Information ==='; cr.Transcript nl.

Transcript show: ride1 rideInfo; cr.

Transcript show: ride2 rideInfo; cr.Transcript show: '=== Ride Information ==='; nl.

Transcript show: ride3 rideInfo; cr.Transcript show: ride1 rideInfo.

Transcript show: ride4 rideInfo; cr.Transcript show: ride2 rideInfo.
Transcript show: ride3 rideInfo.
Transcript show: ride4 rideInfo.