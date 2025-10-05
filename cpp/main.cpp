#include <iostream>
#include <vector>
#include "Driver.h"
#include "Rider.h"
#include "StandardRide.h"
#include "PremiumRide.h"

int main() {
    // Create drivers
    Driver driver1("D001", "John Smith");
    Driver driver2("D002", "Jane Doe");

    // Create riders
    Rider rider1("R001", "Alice Brown");
    Rider rider2("R002", "Bob Wilson");

    // Create rides
    Ride* ride1 = new StandardRide("SR001", "123 Main St", "456 Oak Ave", 5.5);
    Ride* ride2 = new PremiumRide("PR001", "789 Pine St", "321 Elm St", 3.2);
    Ride* ride3 = new StandardRide("SR002", "555 Park Ave", "777 Lake St", 4.8);
    Ride* ride4 = new PremiumRide("PR002", "999 Hill Rd", "888 Valley Dr", 7.1);

    // Assign rides to drivers and riders
    driver1.addRide(ride1);
    driver1.addRide(ride2);
    driver2.addRide(ride3);
    driver2.addRide(ride4);

    rider1.requestRide(ride1);
    rider1.requestRide(ride4);
    rider2.requestRide(ride2);
    rider2.requestRide(ride3);

    // Update driver ratings
    driver1.updateRating(4.8);
    driver2.updateRating(4.9);

    // Display system information
    std::cout << "\n=== Driver Information ===\n\n";
    std::cout << driver1.getDriverInfo() << "\n";
    std::cout << driver2.getDriverInfo() << "\n";

    std::cout << "\n=== Rider Information ===\n\n";
    std::cout << rider1.viewRides() << "\n";
    std::cout << rider2.viewRides() << "\n";

    return 0;
}