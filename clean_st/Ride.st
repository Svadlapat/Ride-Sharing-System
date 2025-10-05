Object subclass: #Ride
    instanceVariableNames: 'rideID pickupLocation dropoffLocation distance'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'RideSharingSystem'!

!Ride class methodsFor: 'instance creation'!
new: id pickup: pickup dropoff: dropoff distance: dist
    ^(super new)
        initializeWithID: id pickup: pickup dropoff: dropoff distance: dist;
        yourself
!!

!Ride methodsFor: 'initialization'!
initializeWithID: id pickup: pickup dropoff: dropoff distance: dist
    rideID := id.
    pickupLocation := pickup.
    dropoffLocation := dropoff.
    distance := dist.
    ^self
!!

!Ride methodsFor: 'accessing'!
rideID
    ^rideID
!!

distance
    ^distance
!!

pickupLocation
    ^pickupLocation
!!

dropoffLocation
    ^dropoffLocation
!!

fare
    ^self calculateFare
!!

!Ride methodsFor: 'operations'!
calculateFare
    self subclassResponsibility
!!

!Ride methodsFor: 'printing'!
rideInfo
    | str |
    str := 'Ride ID: ', rideID printString, Character nl asString,
           'Pickup: ', pickupLocation printString, Character nl asString,
           'Dropoff: ', dropoffLocation printString, Character nl asString,
           'Distance: ', distance printString, ' miles', Character nl asString,
           'Fare: $', self calculateFare printString, Character nl asString.
    ^str
!!