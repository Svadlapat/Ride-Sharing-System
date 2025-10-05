#include "Ride.h"
#include <sstream>

Ride::Ride(std::string id, std::string pickup, std::string dropoff, double dist)
    : rideID(id), pickupLocation(pickup), dropoffLocation(dropoff), distance(dist), baseFare(0.0) {}

std::string Ride::getRideID() const { return rideID; }
std::string Ride::getPickupLocation() const { return pickupLocation; }
std::string Ride::getDropoffLocation() const { return dropoffLocation; }
double Ride::getDistance() const { return distance; }

std::string Ride::rideDetails() const {
    std::stringstream ss;
    ss << "Ride ID: " << rideID << "\n"
       << "Pickup: " << pickupLocation << "\n"
       << "Dropoff: " << dropoffLocation << "\n"
       << "Distance: " << distance << " miles\n"
       << "Fare: $" << fare() << "\n";
    return ss.str();
}