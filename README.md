# Ride Sharing System

This repository contains implementations of a Ride Sharing System in both C++ (fully working) and Smalltalk (work in progress), demonstrating key Object-Oriented Programming principles: encapsulation, inheritance, and polymorphism.

## Project Structure

```
.
├── cpp/                    # C++ implementation (Working)
│   ├── CMakeLists.txt     # CMake build configuration
│   ├── Driver.cpp/h       # Driver class implementation
│   ├── PremiumRide.cpp/h  # Premium ride class
│   ├── Ride.cpp/h         # Base ride class
│   ├── Rider.cpp/h        # Rider class
│   ├── StandardRide.cpp/h # Standard ride class
│   └── main.cpp          # Main program
├── clean_st/             # GNU Smalltalk implementation (Work in Progress)
│   ├── Driver.st
│   ├── main.st
│   ├── PremiumRide.st
│   ├── Ride.st
│   ├── Rider.st
│   └── StandardRide.st
└── docs/                 # Documentation
```

## Implementation Details

### Object-Oriented Design Principles

1. **Encapsulation**
   - Private member variables with public accessor methods
   - Data hiding and implementation details abstraction
   - Protected access for inheritance

2. **Inheritance**
   - Base class `Ride` with derived classes `StandardRide` and `PremiumRide`
   - Common attributes and methods in base class
   - Specialized behavior in derived classes

3. **Polymorphism**
   - Virtual methods for fare calculation and ride details
   - Runtime method resolution based on object type
   - Collection of different ride types treated uniformly

### C++ Implementation

1. Build Requirements:
   - CMake 3.10 or higher
   - C++17 compliant compiler

2. Build Instructions:
   ```bash
   cd cpp
   mkdir build
   cd build
   cmake ..
   make
   ```

3. Run the program:
   ```bash
   ./ride_sharing_system
   ```

### Smalltalk Implementation (Work in Progress)

The Smalltalk implementation is provided in two versions:

1. **GNU Smalltalk Version** (in `clean_st/`)
   - Contains the basic implementation
   - Classes: Ride, StandardRide, PremiumRide, Driver, and Rider
   - Note: This is a work in progress and may require debugging

2. **Requirements for GNU Smalltalk:**
   - GNU Smalltalk runtime
   - Files need to be loaded in this order:
     ```
     Ride.st
     StandardRide.st
     PremiumRide.st
     Driver.st
     Rider.st
     main.st
     ```

Note: While the C++ implementation is fully functional, the Smalltalk implementation is provided for academic purposes and may require additional work to run successfully. The code structure and object-oriented principles are demonstrated in both implementations.

## Testing

The C++ implementation has been thoroughly tested and works as expected. To verify:
1. Build using the instructions above
2. Run the executable
3. Compare output with the expected output shown in the C++ section

## Additional Notes

- The C++ implementation is the primary, fully-functional version
- Smalltalk files are provided to demonstrate the same concepts in a different programming paradigm
- Both implementations follow the same object-oriented design principles

Note: The code is written in standard Smalltalk syntax and should work in any Smalltalk implementation.

## Features

1. **Ride Management**
   - Different types of rides (Standard and Premium)
   - Fare calculation based on distance and ride type
   - Detailed ride information

2. **Driver Management**
   - Track assigned rides
   - Calculate earnings
   - Maintain driver ratings

3. **Rider Management**
   - Request rides
   - View ride history
   - Calculate total spending

## Object Model

1. **Ride (Abstract Base Class)**
   - Core attributes: rideID, pickupLocation, dropoffLocation, distance
   - Virtual methods: fare(), rideDetails()

2. **StandardRide and PremiumRide**
   - Inherit from Ride
   - Override fare calculation
   - Add specific features (e.g., luxury fee for premium rides)

3. **Driver**
   - Manages assigned rides
   - Tracks performance metrics
   - Calculates earnings

4. **Rider**
   - Manages requested rides
   - Tracks ride history
   - Calculates expenses

## Usage Example

The main programs in both implementations demonstrate:
1. Creating drivers and riders
2. Creating different types of rides
3. Assigning rides to drivers
4. Recording ride requests from riders
5. Updating driver ratings
6. Displaying system information

## Contributing

Feel free to submit issues and enhancement requests!

## License

This project is licensed under the MIT License - see the LICENSE file for details.