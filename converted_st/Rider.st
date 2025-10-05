"Rider class implementation"
Object subclass: Rider [
    | riderID name assignedRides |
    
    <comment: "I represent a rider in the ride sharing system">
    
    "Instance creation"
    Rider class >> new: id name: riderName [
        ^self new
            initializeWithID: id name: riderName;
            yourself
    ]
    
    "Initialization"
    initializeWithID: id name: riderName [
        riderID := id.
        name := riderName.
        assignedRides := OrderedCollection new.
        ^self
    ]
    
    "Accessing"
    riderID [ ^riderID ]
    name [ ^name ]
    
    "Methods"
    requestRide: aRide [
        assignedRides add: aRide.
        ^self
    ]
    
    calculateTotalSpent [
        ^assignedRides inject: 0 into: [ :sum :ride | sum + ride fare ]
    ]
    
    viewRides [
        ^String streamContents: [ :stream |
            stream 
                nextPutAll: "Rides for "; nextPutAll: name printString; nextPutAll: ":"; cr.
            assignedRides do: [ :ride |
                stream nextPutAll: ride rideInfo; cr
            ].
            stream
                nextPutAll: "Total spent: $"; print: self calculateTotalSpent; cr
        ]
    ]
]
