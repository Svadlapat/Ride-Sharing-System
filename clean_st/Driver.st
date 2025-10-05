Object subclass: #Driver
    instanceVariableNames: 'driverID name rating assignedRides'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'RideSharingSystem'!

!Driver class methodsFor: 'instance creation'!
new: id name: driverName
    ^(super new)
        initializeWithID: id name: driverName;
        yourself
!!
    
!Driver methodsFor: 'initialization'!
initializeWithID: id name: driverName
    driverID := id.
    name := driverName.
    rating := 5.0.
    assignedRides := Array new: 0.
    ^self
!!

!Driver methodsFor: 'accessing'!
driverID
    ^driverID
!!

name
    ^name
!!

rating
    ^rating
!!

!Driver methodsFor: 'operations'!
addRide: aRide
    assignedRides := assignedRides copyWith: aRide
!!

calculateTotalEarnings
    | sum |
    sum := 0.
    1 to: assignedRides size do: [:i |
        sum := sum + ((assignedRides at: i) calculateFare)].
    ^sum
!!

updateRating: newRating
    (newRating between: 0 and: 5) ifTrue: [
        rating := ((rating + newRating) / 2.0) asFloat
    ]
!!

!Driver methodsFor: 'printing'!
driverInfo
    | str |
    str := 'Driver ID: ', driverID printString, Character nl asString,
           'Name: ', name printString, Character nl asString,
           'Rating: ', rating printString, Character nl asString,
           'Total rides: ', assignedRides size printString, Character nl asString,
           'Total earnings: $', self calculateTotalEarnings printString, Character nl asString.
    ^str
!!