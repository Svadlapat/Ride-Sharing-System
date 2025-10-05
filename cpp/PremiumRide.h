#ifndef PREMIUM_RIDE_H
#define PREMIUM_RIDE_H

#include "Ride.h"

class PremiumRide : public Ride {
private:
    static constexpr double RATE_PER_MILE = 3.5;
    static constexpr double LUXURY_FEE = 10.0;

public:
    PremiumRide(std::string id, std::string pickup, std::string dropoff, double dist);
    double fare() const override;
    std::string rideDetails() const override;
};

#endif // PREMIUM_RIDE_H