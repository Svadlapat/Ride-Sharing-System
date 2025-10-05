#ifndef STANDARD_RIDE_H
#define STANDARD_RIDE_H

#include "Ride.h"

class StandardRide : public Ride {
private:
    static constexpr double RATE_PER_MILE = 2.0;

public:
    StandardRide(std::string id, std::string pickup, std::string dropoff, double dist);
    double fare() const override;
    std::string rideDetails() const override;
};

#endif // STANDARD_RIDE_H