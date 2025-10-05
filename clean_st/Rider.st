Object subclass: #Rider
    instanceVariableNames: 'riderID name requestedRides'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'RideSharingSystem'!

!Rider class methodsFor: 'instance creation'!
new: id name: riderName
    ^(super new)
        initializeWithID: id name: riderName;
        yourself
!!

!Rider methodsFor: 'initialization'!
initializeWithID: id name: riderName
    riderID := id.
    name := riderName.
    requestedRides := Array new: 0.
    ^self
!!

!Rider methodsFor: 'accessing'!
riderID
    ^riderID
!!

name
    ^name
!!

!Rider methodsFor: 'operations'!
requestRide: aRide
    requestedRides := requestedRides copyWith: aRide
!!

calculateTotalSpent
    | sum |
    sum := 0.
    1 to: requestedRides size do: [:i |
        sum := sum + ((requestedRides at: i) calculateFare)].
    ^sum
!!

!Rider methodsFor: 'printing'!
riderInfo
    | str |
    str := 'Rider ID: ', riderID printString, Character nl asString,
           'Name: ', name printString, Character nl asString,
           'Total rides: ', requestedRides size printString, Character nl asString,
           'Total spent: $', self calculateTotalSpent printString, Character nl asString.
    ^str
!!