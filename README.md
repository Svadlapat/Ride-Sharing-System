# Ride Sharing System

This repository contains implementations of a Ride Sharing System in both C++ and GNU Smalltalk, demonstrating key Object-Oriented Programming principles: encapsulation, inheritance, and polymorphism.

## Project Structure

```
.
├── cpp/                    # C++ implementation
│   ├── CMakeLists.txt     # CMake build configuration
│   ├── Driver.cpp/h       # Driver class implementation
│   ├── PremiumRide.cpp/h  # Premium ride class
│   ├── Ride.cpp/h         # Base ride class
│   ├── Rider.cpp/h        # Rider class
│   ├── StandardRide.cpp/h # Standard ride class
│   └── main.cpp           # Main program
├── clean_st/              # GNU Smalltalk implementation
│   ├── Driver.st          # Driver class
│   ├── main.st            # Main program
│   ├── PremiumRide.st     # Premium ride class
│   ├── Ride.st            # Base ride class
│   ├── Rider.st           # Rider class
│   └── StandardRide.st    # Standard ride class
└── converted_st/          # Converted Smalltalk files
    ├── Driver.st          # Converted Driver class
    ├── main.st            # Converted main program
    ├── PremiumRide.st     # Converted Premium ride class
    ├── Ride.st            # Converted base ride class
    ├── Rider.st           # Converted Rider class
    └── StandardRide.st    # Converted Standard ride class
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

### GNU Smalltalk Implementation

The Smalltalk implementation uses GNU Smalltalk and can be run using Docker for consistent execution across platforms. The code is available in two directories:
- `clean_st/`: Main Smalltalk implementation directory
- `converted_st/`: Contains converted Smalltalk files (if you need to convert between different Smalltalk dialects)

1. Build and Run using Docker:
   ```bash
   cd clean_st
   docker build -t ride-sharing-st .
   docker run -it ride-sharing-st
   ```

2. Alternative: Run with GNU Smalltalk directly (if installed):
   ```bash
   cd clean_st
   gst -f main.st
   ```




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

## Sample Output

### C++ Implementation Output
```
=== Driver Information ===
Driver ID: D001
Name: John Smith
Rating: 4.9
Total rides: 2
Total earnings: $32.2

Driver ID: D002
Name: Jane Doe
Rating: 4.95
Total rides: 2
Total earnings: $44.45

=== Rider Information ===
Rider ID: R001
Name: Alice Brown
Total rides: 2
Total spent: $45.85

Standard Ride Details:
- Ride ID: SR001
- Pickup: 123 Main St
- Dropoff: 456 Oak Ave
- Distance: 5.5 miles
- Fare: $11.00
- Rate per mile: $2.00

Premium Ride Details:
- Ride ID: PR002
- Pickup: 999 Hill Rd
- Dropoff: 888 Valley Dr
- Distance: 7.1 miles
- Fare: $34.85
- Rate per mile: $3.50
- Luxury fee: $10.00
```

### GNU Smalltalk Implementation Output
```
=== Driver Information ===
Driver: D001
Name: John Smith
Rating: 4.9
Total rides: 2
Total earnings: $32.20

Driver: D002
Name: Jane Doe
Rating: 4.95
Total rides: 2
Total earnings: $44.45

=== Rider Information ===
Rider: Alice Brown (R001)
Total rides: 2
Total spent: $45.85

Standard Ride: SR001
Pickup: 123 Main St
Dropoff: 456 Oak Ave
Distance: 5.5 miles
Fare: $11.00
Rate per mile: $2.00

Premium Ride: PR002
Pickup: 999 Hill Rd
Dropoff: 888 Valley Dr
Distance: 7.1 miles
Fare: $34.85
Rate per mile: $3.50
Luxury fee: $10.00
```

## Contributing

I welcome contributions to improve both the C++ and Smalltalk implementations. Here's how you can contribute:

### Getting Started

1. Fork the repository
2. Create a new branch for your feature:
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. Make your changes
4. Submit a pull request

### Contribution Guidelines

1. **Code Style**
   - C++: Follow the existing style (indentation, naming conventions)
   - Smalltalk: Use standard Smalltalk conventions
   - Keep methods focused and concise
   - Add comments for complex logic

2. **Adding Features**
   - Implement in both C++ and Smalltalk when possible
   - Update test cases accordingly
   - Document new features in README.md
   - Follow existing patterns for consistency

3. **Bug Fixes**
   - Clearly describe the bug in your PR
   - Include steps to reproduce
   - Add test cases to prevent regression

4. **Documentation**
   - Update README.md for significant changes
   - Include code examples where helpful
   - Document any new dependencies

### Testing

1. For C++ changes:
   - Ensure all tests pass
   - Add new tests for new features
   - Verify build works with provided CMake configuration

2. For Smalltalk changes:
   - Test with both clean_st and converted_st versions
   - Verify Docker execution works
   - Test with native GNU Smalltalk if possible

### Pull Request Process

1. Update documentation to reflect changes
2. Ensure your code builds without errors
3. Write clear commit messages
4. Reference any related issues
5. Wait for code review

For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the MIT License - see the LICENSE file for details.