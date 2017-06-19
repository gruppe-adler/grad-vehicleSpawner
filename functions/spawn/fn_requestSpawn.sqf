#include "component.hpp"

params [["_display",displayNull],["_vehicleType",""],["spawnPos",[0,0,0,0]],["_moveInDriver",false]];

[_display] call grad_vehicleSpawner_fnc_deletePreview;
[_vehicleType,_spawnPos,_moveInDriver] remoteExec ["grad_vehicleSpawner_fnc_spawnVehicle",2,false];
