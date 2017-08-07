#include "component.hpp"

if (isServer) then {
    grad_vehicleSpawner_activeVehicleCount = 0;
    grad_vehicleSpawner_maxVehicles = [missionConfigFile >> "cfgGradVehicleSpawner","maxVehicles",40] call BIS_fnc_returnConfigEntry;
    grad_vehicleSpawner_vehicleAbandonedTime = [missionConfigFile >> "cfgGradVehicleSpawner","abandonedTime",1200] call BIS_fnc_returnConfigEntry;
};
