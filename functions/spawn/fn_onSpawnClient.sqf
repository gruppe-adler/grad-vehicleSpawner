#include "component.hpp"

#include "..\..\dialog\defines.hpp"

params [["_veh",objNull]];

if (isNull _veh) exitWith {};

if (isNil "grad_vehicleSpawner_myVehicles") then {grad_vehicleSpawner_myVehicles = []};
grad_vehicleSpawner_myVehicles pushBack _veh;

disableSerialization;
private _display = uiNamespace getVariable ["grad_vehicleSpawner_display",displayNull];
if (isNull _display) exitWith {};

[_display,_veh] call grad_vehicleSpawner_fnc_updateMyVehiclesInfo;
