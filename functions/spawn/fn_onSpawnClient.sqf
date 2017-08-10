#include "component.hpp"

#include "..\..\dialog\defines.hpp"

params [["_veh",objNull]];

if (isNull _veh) exitWith {};

if (isNil "grad_vehicleSpawner_myVehicles") then {grad_vehicleSpawner_myVehicles = []};
grad_vehicleSpawner_myVehicles pushBack _veh;
grad_vehicleSpawner_myVehicles = grad_vehicleSpawner_myVehicles - [objNull];

if (count grad_vehicleSpawner_myVehicles > grad_vehicleSpawner_maxVehiclesUser) then {
    _deletableVeh = objNull;
    {
        if ({isPlayer _x} count crew _veh == 0) exitWith {_deletableVeh = _x; false};
        false
    } count grad_vehicleSpawner_myVehicles;

    if (!isNull _deletableVeh) then {
        [_deletableVeh] remoteExec ["grad_vehicleSpawner_fnc_deleteVehicle",2,false];
    };
};

disableSerialization;
private _display = uiNamespace getVariable ["grad_vehicleSpawner_display",displayNull];
if (isNull _display) exitWith {};

[_display,_veh] call grad_vehicleSpawner_fnc_updateMyVehiclesInfo;
