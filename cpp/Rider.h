#ifndef RIDER_H
#define RIDER_H

#include <string>
#include <vector>
#include "Ride.h"

class Rider {
private:
    std::string riderID;
    std::string name;
    std::vector<Ride*> requestedRides;  // Using pointer to support polymorphism

public:
    Rider(std::string id, std::string riderName);
    ~Rider();

    // Getters
    std::string getRiderID() const;
    std::string getName() const;

    // Methods
    void requestRide(Ride* ride);
    std::string viewRides() const;
    double calculateTotalSpent() const;
};

#endif // RIDER_H