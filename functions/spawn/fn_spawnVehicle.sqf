#include "component.hpp"

params ["_vehClass","_textures","_animations","_spawnPos",["_side",WEST]];

_spawnPos params ["_x","_y",["_z",0],["_dir",0]];
private _actualSpawnPos = [[_x,_y,_z],_vehClass] call grad_vehicleSpawner_fnc_findEmptyPosition;

private _veh = _vehClass createVehicle [0,0,0];
_veh setDir _dir;
_veh setPos _actualSpawnPos;
[_veh,_textures,_animations,true] call BIS_fnc_initVehicle;
_veh setVariable ["grad_vehicleSpawner_ownerID",remoteExecutedOwner];
_veh setVariable ["grad_vehicleSpawner_textures",_textures];

if ([configFile >> "cfgVehicles" >> _vehClass,"isUAV",0] call BIS_fnc_returnConfigEntry == 1) then {
    [_veh,_side] call grad_vehicleSpawner_fnc_createDroneAI;
};

[_veh] remoteExec ["grad_vehicleSpawner_fnc_onSpawnClient",remoteExecutedOwner,false];
[_veh] call grad_vehicleSpawner_fnc_trackVehicleStatus;
