#include "component.hpp"

params [["_vehicleType",""],["spawnPos",[0,0,0,0]],["_moveInDriver",false]];

_spawnPos params ["_x","_y",["z",0],["_dir",0]]

_spawnPos = _spawnPos findEmptyPosition [0, 10, _vehicleType];
if (count _spawnPos == 0) exitWith {[objNull] remoteExec ["grad_vehicleSpawner_fnc_onSpawnClient",remoteExecutedOwner,false]};

private _veh = _vehicleType createVehicle [0,0,0];
_veh setDir _dir;
_veh setPos _spawnPos;

[_veh] remoteExec ["grad_vehicleSpawner_fnc_onSpawnClient",remoteExecutedOwner,false];
[_veh] call grad_vehicleSpawner_fnc_trackVehicleStatus;
