"StandardRide class implementation"
Ride subclass: StandardRide [
    <comment: "I represent a standard ride with base pricing">
    
    calculateFare [
        "Standard rate is $2 per km with $5 base fare"
        fare := 5.0 + (2.0 * (distance asFloat)).
        ^self
    ]
]
