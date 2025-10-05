"Ride class implementation"
Object subclass: Ride [
    | rideID pickup dropoff distance fare |
    
    <comment: "I represent a ride in the ride sharing system">
    
    "Instance creation"
    Ride class >> new: id pickup: pickupLoc dropoff: dropoffLoc distance: dist [
        ^self new
            initializeWithID: id pickup: pickupLoc dropoff: dropoffLoc distance: dist;
            yourself
    ]
    
    "Initialization"
    initializeWithID: id pickup: pickupLoc dropoff: dropoffLoc distance: dist [
        rideID := id.
        pickup := pickupLoc.
        dropoff := dropoffLoc.
        distance := dist.
        self calculateFare.
        ^self
    ]
    
    "Methods"
    calculateFare [
        self subclassResponsibility
    ]
    
    fare [ ^fare ]
    
    rideInfo [
        ^String streamContents: [ :stream |
            stream
                nextPutAll: "Ride ID: "; nextPutAll: rideID printString; cr;
                nextPutAll: "Pickup: "; nextPutAll: pickup printString; cr;
                nextPutAll: "Dropoff: "; nextPutAll: dropoff printString; cr;
                nextPutAll: "Distance: "; print: distance; nextPutAll: " km"; cr;
                nextPutAll: "Fare: $"; print: fare; cr
        ]
    ]
]
