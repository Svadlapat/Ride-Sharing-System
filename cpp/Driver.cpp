#include "Driver.h"
#include <sstream>

Driver::Driver(std::string id, std::string driverName)
    : driverID(id), name(driverName), rating(5.0) {}

Driver::~Driver() {
    assignedRides.clear();  // We don't own the rides, just clear the vector
}

std::string Driver::getDriverID() const { return driverID; }
std::string Driver::getName() const { return name; }
double Driver::getRating() const { return rating; }

void Driver::addRide(Ride* ride) {
    assignedRides.push_back(ride);
}

std::string Driver::getDriverInfo() const {
    std::stringstream ss;
    ss << "Driver ID: " << driverID << "\n"
       << "Name: " << name << "\n"
       << "Rating: " << rating << "\n"
       << "Total rides: " << assignedRides.size() << "\n"
       << "Total earnings: $" << calculateTotalEarnings() << "\n";
    return ss.str();
}

double Driver::calculateTotalEarnings() const {
    double total = 0.0;
    for (const auto& ride : assignedRides) {
        total += ride->fare();
    }
    return total;
}

void Driver::updateRating(double newRating) {
    if (newRating >= 0.0 && newRating <= 5.0) {
        rating = (rating + newRating) / 2.0;
    }
}