"PremiumRide class implementation"
Ride subclass: PremiumRide [
    <comment: "I represent a premium ride with higher pricing">
    
    calculateFare [
        "Premium rate is $3.5 per km with $10 base fare"
        fare := 10.0 + (3.5 * (distance asFloat)).
        ^self
    ]
]
