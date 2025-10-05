Ride subclass: #StandardRide
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'RideSharingSystem'!

!StandardRide methodsFor: 'operations'!
calculateFare
    "Base rate of $5 plus $2 per kilometer"
    ^5.0 + (2.0 * distance)
!!