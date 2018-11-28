#include "component.hpp"

GVAR(maxVehiclesUser) = [missionConfigFile >> "cfgGradVehicleSpawner","maxVehiclesUser",5] call BIS_fnc_returnConfigEntry;
GVAR(onDisplayOpen) = compile ([missionConfigFile >> "cfgGradVehicleSpawner","onDisplayOpen",""] call BIS_fnc_returnConfigEntry);
GVAR(onDisplayClose) = compile ([missionConfigFile >> "cfgGradVehicleSpawner","onDisplayClose",""] call BIS_fnc_returnConfigEntry);
GVAR(eventParams) = [missionConfigFile >> "cfgGradVehicleSpawner","eventParams",[]] call BIS_fnc_returnConfigEntry;
GVAR(onSpawn) = compile ([missionConfigFile >> "cfgGradVehicleSpawner","onSpawn",""] call BIS_fnc_returnConfigEntry);

if (isServer) then {
    GVAR(activeVehicleCount) = 0;
    GVAR(maxVehicles) = [missionConfigFile >> "cfgGradVehicleSpawner","maxVehicles",40] call BIS_fnc_returnConfigEntry;
    GVAR(vehicleAbandonedTime) = [missionConfigFile >> "cfgGradVehicleSpawner","abandonedTime",1200] call BIS_fnc_returnConfigEntry;
};
