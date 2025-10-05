cmake_minimum_required(VERSION 3.10)
project(RideSharingSystem)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(ride_sharing_system
    main.cpp
    Ride.cpp
    StandardRide.cpp
    PremiumRide.cpp
    Driver.cpp
    Rider.cpp
)