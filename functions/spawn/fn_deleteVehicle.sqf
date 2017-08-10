#include "component.hpp"

params [["_veh",objNull]];

if (isNull _veh) exitWith {};
if ({isPlayer _x} count crew _veh > 0) exitWith {};

private _owner = _veh getVariable ["grad_vehicleSpawner_ownerID",remoteExecutedOwner];
deleteVehicle _veh;
[] remoteExec  ["grad_vehicleSpawner_fnc_updateMyVehiclesInfo",_owner,false];
