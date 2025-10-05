#ifndef RIDE_H
#define RIDE_H

#include <string>

class Ride {
protected:
    std::string rideID;
    std::string pickupLocation;
    std::string dropoffLocation;
    double distance;
    double baseFare;

public:
    Ride(std::string id, std::string pickup, std::string dropoff, double dist);
    virtual ~Ride() = default;

    // Getters
    std::string getRideID() const;
    std::string getPickupLocation() const;
    std::string getDropoffLocation() const;
    double getDistance() const;

    // Virtual methods
    virtual double fare() const = 0;  // Pure virtual method
    virtual std::string rideDetails() const;
};

#endif // RIDE_H