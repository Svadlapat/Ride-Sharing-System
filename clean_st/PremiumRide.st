Ride subclass: #PremiumRide
    instanceVariableNames: ''
    classVariableNames: ''
    poolDictionaries: ''
    category: 'RideSharingSystem'!

!PremiumRide methodsFor: 'operations'!
calculateFare
    "Base rate of $10 plus $3 per kilometer"
    ^10.0 + (3.0 * distance)
!!