"Create base Ride class""Create base Ride class"

Object subclass: Ride [Object subclass: Ride [

    | rideID pickupLocation dropoffLocation distance |    | rideID pickupLocation dropoffLocation distance |

        

    Ride class >> new: id pickup: pickup dropoff: dropoff distance: dist [    Ride class >> new: id pickup: pickup dropoff: dropoff distance: dist [

        ^super new        ^super new

            initializeWithID: id pickup: pickup dropoff: dropoff distance: dist;            initializeWithID: id pickup: pickup dropoff: dropoff distance: dist;

            yourself            yourself

    ]    ]



    initializeWithID: id pickup: pickup dropoff: dropoff distance: dist [    initializeWithID: id pickup: pickup dropoff: dropoff distance: dist [

        rideID := id.        rideID := id.

        pickupLocation := pickup.        pickupLocation := pickup.

        dropoffLocation := dropoff.        dropoffLocation := dropoff.

        distance := dist.        distance := dist.

        ^self        ^self

    ]    ]



    rideID [ ^rideID ]    rideID [ ^rideID ]

    distance [ ^distance ]    distance [ ^distance ]

    pickupLocation [ ^pickupLocation ]    pickupLocation [ ^pickupLocation ]

    dropoffLocation [ ^dropoffLocation ]    dropoffLocation [ ^dropoffLocation ]

    fare [ ^self calculateFare ]    fare [ ^self calculateFare ]



    calculateFare [    calculateFare [

        self subclassResponsibility        self subclassResponsibility

    ]    ]



    formatFloat: aFloat [    rideInfo [

        | str |        ^'Ride ID: ', rideID printString, Character nl asString,

        str := aFloat printString.         'Pickup: ', pickupLocation printString, Character nl asString,

        (str indexOf: $.) = 0 ifTrue: [str := str, '.0'].         'Dropoff: ', dropoffLocation printString, Character nl asString,

        ^str         'Distance: ', distance printString, ' miles', Character nl asString,

    ]         'Fare: $', self calculateFare printString, Character nl asString

    ]

    rideInfo [].

        ^'Ride ID: ', rideID printString, Character nl asString,

         'Pickup: ', pickupLocation printString, Character nl asString,"Create StandardRide class"

         'Dropoff: ', dropoffLocation printString, Character nl asString,Ride subclass: StandardRide [

         'Distance: ', (self formatFloat: distance), ' miles', Character nl asString,    calculateFare [

         'Fare: $', (self formatFloat: self calculateFare), Character nl asString        "Base rate of $5 plus $2 per mile"

    ]        ^5.0 + (2.0 * distance)

].    ]

].

"Create StandardRide class"

Ride subclass: StandardRide ["Create PremiumRide class"

    calculateFare [Ride subclass: PremiumRide [

        "Base rate of $5 plus $2 per mile"    calculateFare [

        ^5.0 + (2.0 * distance)        "Base rate of $10 plus $3 per mile"

    ]        ^10.0 + (3.0 * distance)

].    ]

].

"Create PremiumRide class"

Ride subclass: PremiumRide ["Create Driver class"

    calculateFare [Object subclass: Driver [

        "Base rate of $10 plus $3 per mile"    | driverID name rating assignedRides |

        ^10.0 + (3.0 * distance)

    ]    Driver class >> new: id name: driverName [

].        ^super new

            initializeWithID: id name: driverName;

"Create Driver class"            yourself

Object subclass: Driver [    ]

    | driverID name rating assignedRides |

    initializeWithID: id name: driverName [

    Driver class >> new: id name: driverName [        driverID := id.

        ^super new        name := driverName.

            initializeWithID: id name: driverName;        rating := 5.0.

            yourself        assignedRides := Array new: 0.

    ]        ^self

    ]

    initializeWithID: id name: driverName [

        driverID := id.    driverID [ ^driverID ]

        name := driverName.    name [ ^name ]

        rating := 5.0.    rating [ ^rating ]

        assignedRides := Array new: 0.

        ^self    addRide: aRide [

    ]        assignedRides := assignedRides copyWith: aRide

    ]

    driverID [ ^driverID ]

    name [ ^name ]    calculateTotalEarnings [

    rating [ ^rating ]        | sum |

        sum := 0.

    addRide: aRide [        1 to: assignedRides size do: [:i |

        assignedRides := assignedRides copyWith: aRide            sum := sum + ((assignedRides at: i) calculateFare)].

    ]        ^sum

    ]

    calculateTotalEarnings [

        | sum |    updateRating: newRating [

        sum := 0.0.        (newRating between: 0 and: 5) ifTrue: [

        1 to: assignedRides size do: [:i |            rating := ((rating + newRating) / 2.0) asFloat]

            sum := sum + ((assignedRides at: i) calculateFare)].    ]

        ^sum

    ]    driverInfo [

        ^'Driver ID: ', driverID printString, Character nl asString,

    updateRating: newRating [         'Name: ', name printString, Character nl asString,

        (newRating between: 0 and: 5) ifTrue: [         'Rating: ', rating printString, Character nl asString,

            rating := ((rating + newRating) / 2.0) asFloat]         'Total rides: ', assignedRides size printString, Character nl asString,

    ]         'Total earnings: $', self calculateTotalEarnings printString, Character nl asString

    ]

    formatFloat: aFloat [].

        | str |

        str := aFloat printString."Create Rider class"

        (str indexOf: $.) = 0 ifTrue: [str := str, '.0'].Object subclass: Rider [

        ^str    | riderID name requestedRides |

    ]

    Rider class >> new: id name: riderName [

    driverInfo [        ^super new

        ^'Driver ID: ', driverID printString, Character nl asString,            initializeWithID: id name: riderName;

         'Name: ', name printString, Character nl asString,            yourself

         'Rating: ', (self formatFloat: rating), Character nl asString,    ]

         'Total rides: ', assignedRides size printString, Character nl asString,

         'Total earnings: $', (self formatFloat: self calculateTotalEarnings), Character nl asString    initializeWithID: id name: riderName [

    ]        riderID := id.

].        name := riderName.

        requestedRides := Array new: 0.

"Create Rider class"        ^self

Object subclass: Rider [    ]

    | riderID name requestedRides |

    riderID [ ^riderID ]

    Rider class >> new: id name: riderName [    name [ ^name ]

        ^super new

            initializeWithID: id name: riderName;    requestRide: aRide [

            yourself        requestedRides := requestedRides copyWith: aRide

    ]    ]



    initializeWithID: id name: riderName [    calculateTotalSpent [

        riderID := id.        | sum |

        name := riderName.        sum := 0.

        requestedRides := Array new: 0.        1 to: requestedRides size do: [:i |

        ^self            sum := sum + ((requestedRides at: i) calculateFare)].

    ]        ^sum

    ]

    riderID [ ^riderID ]

    name [ ^name ]    riderInfo [

        ^'Rider ID: ', riderID printString, Character nl asString,

    requestRide: aRide [         'Name: ', name printString, Character nl asString,

        requestedRides := requestedRides copyWith: aRide         'Total rides: ', requestedRides size printString, Character nl asString,

    ]         'Total spent: $', self calculateTotalSpent printString, Character nl asString

    ]

    calculateTotalSpent [].

        | sum |

        sum := 0.0."Create test data"

        1 to: requestedRides size do: [:i |driver1 := Driver new: 'D001' name: 'John Smith'.

            sum := sum + ((requestedRides at: i) calculateFare)].driver2 := Driver new: 'D002' name: 'Jane Doe'.

        ^sum

    ]rider1 := Rider new: 'R001' name: 'Alice Brown'.

rider2 := Rider new: 'R002' name: 'Bob Wilson'.

    formatFloat: aFloat [

        | str |ride1 := StandardRide new: 'SR001' pickup: '123 Main St' dropoff: '456 Oak Ave' distance: 5.5.

        str := aFloat printString.ride2 := PremiumRide new: 'PR001' pickup: '789 Pine St' dropoff: '321 Elm St' distance: 3.2.

        (str indexOf: $.) = 0 ifTrue: [str := str, '.0'].ride3 := StandardRide new: 'SR002' pickup: '555 Park Ave' dropoff: '777 Lake St' distance: 4.8.

        ^strride4 := PremiumRide new: 'PR002' pickup: '999 Hill Rd' dropoff: '888 Valley Dr' distance: 7.1.

    ]

"Assign rides"

    riderInfo [driver1 addRide: ride1.

        ^'Rider ID: ', riderID printString, Character nl asString,driver1 addRide: ride2.

         'Name: ', name printString, Character nl asString,driver2 addRide: ride3.

         'Total rides: ', requestedRides size printString, Character nl asString,driver2 addRide: ride4.

         'Total spent: $', (self formatFloat: self calculateTotalSpent), Character nl asString

    ]rider1 requestRide: ride1.

].rider1 requestRide: ride4.

rider2 requestRide: ride2.

"Create test data"rider2 requestRide: ride3.

driver1 := Driver new: 'D001' name: 'John Smith'.

driver2 := Driver new: 'D002' name: 'Jane Doe'."Update ratings"

driver1 updateRating: 4.8.

rider1 := Rider new: 'R001' name: 'Alice Brown'.driver2 updateRating: 4.9.

rider2 := Rider new: 'R002' name: 'Bob Wilson'.

"Display system information"

ride1 := StandardRide new: 'SR001' pickup: '123 Main St' dropoff: '456 Oak Ave' distance: 5.5.Transcript show: '=== Driver Information ==='; cr.

ride2 := PremiumRide new: 'PR001' pickup: '789 Pine St' dropoff: '321 Elm St' distance: 3.2.Transcript show: driver1 driverInfo; cr.

ride3 := StandardRide new: 'SR002' pickup: '555 Park Ave' dropoff: '777 Lake St' distance: 4.8.Transcript show: driver2 driverInfo; cr.

ride4 := PremiumRide new: 'PR002' pickup: '999 Hill Rd' dropoff: '888 Valley Dr' distance: 7.1.

Transcript show: '=== Rider Information ==='; cr.

"Assign rides"Transcript show: rider1 riderInfo; cr.

driver1 addRide: ride1.Transcript show: rider2 riderInfo; cr.

driver1 addRide: ride2.

driver2 addRide: ride3.Transcript show: '=== Ride Information ==='; cr.

driver2 addRide: ride4.Transcript show: ride1 rideInfo; cr.

Transcript show: ride2 rideInfo; cr.

rider1 requestRide: ride1.Transcript show: ride3 rideInfo; cr.

rider1 requestRide: ride4.Transcript show: ride4 rideInfo; cr.
rider2 requestRide: ride2.
rider2 requestRide: ride3.

"Update ratings"
driver1 updateRating: 4.8.
driver2 updateRating: 4.9.

"Display system information"
Transcript show: '=== Driver Information ==='; cr.
Transcript show: driver1 driverInfo; cr.
Transcript show: driver2 driverInfo; cr.

Transcript show: '=== Rider Information ==='; cr.
Transcript show: rider1 riderInfo; cr.
Transcript show: rider2 riderInfo; cr.

Transcript show: '=== Ride Information ==='; cr.
Transcript show: ride1 rideInfo; cr.
Transcript show: ride2 rideInfo; cr.
Transcript show: ride3 rideInfo; cr.
Transcript show: ride4 rideInfo; cr.