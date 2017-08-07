#include "component.hpp"

params ["_ctrlListTextures","_selID"];

private _configName = _ctrlListTextures lbData _selID;

private _selVeh = missionNamespace getVariable ["grad_vehicleSpawner_selVeh",objNull];
private _myVehicles = missionNamespace getVariable ["grad_vehicleSpawner_myVehicles",[]];
if (_selVeh in _myVehicles) exitWith {};

private _textures = _selVeh getVariable ["grad_vehicleSpawner_textures",[]];
private _textureID = _textures find _configName;
if (_textureID >= 0) then {
    for [{_i=0}, {_i<(count _textures)-1}, {_i=_i+2}] do {
        _textures set [_i+1,0];
    };
    _textures set [_textureID + 1,1];
};

private _animations = _selVeh getVariable ["grad_vehicleSpawner_animations",[]];

[_selVeh,_textures,_animations,true] call BIS_fnc_initVehicle;

[_selVeh] call grad_vehicleSpawner_fnc_updateTexturesList;
