#include "Rider.h"
#include <sstream>

Rider::Rider(std::string id, std::string riderName)
    : riderID(id), name(riderName) {}

Rider::~Rider() {
    requestedRides.clear();  // We don't own the rides, just clear the vector
}

std::string Rider::getRiderID() const { return riderID; }
std::string Rider::getName() const { return name; }

void Rider::requestRide(Ride* ride) {
    requestedRides.push_back(ride);
}

std::string Rider::viewRides() const {
    std::stringstream ss;
    ss << "Ride History for " << name << " (ID: " << riderID << ")\n";
    ss << "Total rides: " << requestedRides.size() << "\n";
    ss << "Total spent: $" << calculateTotalSpent() << "\n\n";
    
    for (const auto& ride : requestedRides) {
        ss << ride->rideDetails() << "\n";
    }
    return ss.str();
}

double Rider::calculateTotalSpent() const {
    double total = 0.0;
    for (const auto& ride : requestedRides) {
        total += ride->fare();
    }
    return total;
}