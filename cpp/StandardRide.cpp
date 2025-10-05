#include "StandardRide.h"
#include <sstream>

StandardRide::StandardRide(std::string id, std::string pickup, std::string dropoff, double dist)
    : Ride(id, pickup, dropoff, dist) {}

double StandardRide::fare() const {
    return distance * RATE_PER_MILE;
}

std::string StandardRide::rideDetails() const {
    std::stringstream ss;
    ss << "Standard " << Ride::rideDetails()
       << "Rate per mile: $" << RATE_PER_MILE << "\n";
    return ss.str();
}