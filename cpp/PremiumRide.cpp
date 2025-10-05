#include "PremiumRide.h"
#include <sstream>

PremiumRide::PremiumRide(std::string id, std::string pickup, std::string dropoff, double dist)
    : Ride(id, pickup, dropoff, dist) {}

double PremiumRide::fare() const {
    return (distance * RATE_PER_MILE) + LUXURY_FEE;
}

std::string PremiumRide::rideDetails() const {
    std::stringstream ss;
    ss << "Premium " << Ride::rideDetails()
       << "Rate per mile: $" << RATE_PER_MILE << "\n"
       << "Luxury fee: $" << LUXURY_FEE << "\n";
    return ss.str();
}