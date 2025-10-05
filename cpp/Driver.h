#ifndef DRIVER_H
#define DRIVER_H

#include <string>
#include <vector>
#include "Ride.h"

class Driver {
private:
    std::string driverID;
    std::string name;
    double rating;
    std::vector<Ride*> assignedRides;  // Using pointer to support polymorphism

public:
    Driver(std::string id, std::string driverName);
    ~Driver();

    // Getters
    std::string getDriverID() const;
    std::string getName() const;
    double getRating() const;

    // Methods
    void addRide(Ride* ride);
    std::string getDriverInfo() const;
    double calculateTotalEarnings() const;
    void updateRating(double newRating);
};

#endif // DRIVER_H