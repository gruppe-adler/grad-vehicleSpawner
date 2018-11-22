#include "component.hpp"

params ["_vehClass","_textures","_animations","_spawnPos",["_pylonMags",[]],["_side",WEST]];

([_spawnPos,_vehClass] call FUNC(findEmptySpawnPosition)) params ["_actualSpawnPos",["_dir",0]];

if (_actualSpawnPos isEqualTo [0,0,0]) exitWith {
    ["Error: Server could not find a spawn position!","3DEN_notificationWarning"] remoteExec [QFUNC(showMessage),remoteExecutedOwner,false];
    [] remoteExec [QFUNC(restorePreview),remoteExecutedOwner,false];
};

private _veh = _vehClass createVehicle [0,0,0];
_veh setDir _dir;
_veh setPos _actualSpawnPos;
[_veh,_textures,_animations,true] call BIS_fnc_initVehicle;
_veh setVariable ["grad_vehicleSpawner_ownerID",remoteExecutedOwner];
_veh setVariable ["grad_vehicleSpawner_textures",_textures];

if (count _pylonMags > 0) then {
    _pylonPaths = (configProperties [configFile >> "CfgVehicles" >> _vehClass >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"]) apply {getArray (_x >> "turret")};
    {_veh removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon") } forEach getPylonMagazines _veh;
    {_veh setPylonLoadOut [_forEachIndex + 1,_x,true,_pylonPaths select _forEachIndex]} forEach _pylonMags;
};

if ([configFile >> "cfgVehicles" >> _vehClass,"isUAV",0] call BIS_fnc_returnConfigEntry == 1) then {
    [_veh,_side] call grad_vehicleSpawner_fnc_createDroneAI;
};

[_veh] remoteExec ["grad_vehicleSpawner_fnc_onSpawnClient",remoteExecutedOwner,false];
[_veh] call grad_vehicleSpawner_fnc_trackVehicleStatus;
