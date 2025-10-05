"Driver class implementation"
Object subclass: Driver [
    | driverID name rating assignedRides |
    
    <comment: "I represent a driver in the ride sharing system">
    
    "Instance creation"
    Driver class >> new: id name: driverName [
        ^self new
            initializeWithID: id name: driverName;
            yourself
    ]
    
    "Initialization"
    initializeWithID: id name: driverName [
        driverID := id.
        name := driverName.
        rating := 5.0.
        assignedRides := OrderedCollection new.
        ^self
    ]
    
    "Accessing"
    driverID [ ^driverID ]
    name [ ^name ]
    rating [ ^rating ]
    
    "Methods"
    addRide: aRide [
        assignedRides add: aRide.
        ^self
    ]
    
    calculateTotalEarnings [
        ^assignedRides inject: 0.0 into: [ :sum :ride | sum + ride fare ]
    ]
    
    updateRating: newRating [
        (newRating between: 0 and: 5) ifTrue: [
            rating := (rating + newRating) / 2
        ].
        ^self
    ]
    
    driverInfo [
        ^String streamContents: [ :stream |
            stream
                nextPutAll: "Driver ID: "; nextPutAll: driverID asString; cr;
                nextPutAll: "Name: "; nextPutAll: name asString; cr;
                nextPutAll: "Rating: "; print: rating asFloat; cr;
                nextPutAll: "Total rides: "; print: assignedRides size; cr;
                nextPutAll: "Total earnings: $"; print: self calculateTotalEarnings; cr
        ]
    ]
]
