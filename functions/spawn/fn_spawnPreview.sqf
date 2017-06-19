#include "component.hpp"

params [["_display",displayNull],["_vehicleType",""],["spawnPos",[0,0,0,0]],["_onSpawn",{}]];

if (isNull _display) exitWith {ERROR("Could not spawn preview. Display is null.")};

[_display] call grad_vehicleSpawner_fnc_deletePreview;
_spawnPos params ["_x","_y",["_z",0],["_dir",0]];

private _preview = _vehicleType createVehicleLocal [0,0,0];
_preview allowDamage false;
_preview setDir _dir;
_preview setPos [_x,_y,0];

_display setVariable ["grad_vehicleSpawner_currentPreview",_preview];

[_preview,_spawnPos] call _onSpawn;

_preview
