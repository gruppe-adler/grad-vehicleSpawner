#include "component.hpp"

params ["_ctrlListTextures","_selID"];

private _configName = _ctrlListTextures lbData _selID;

private _preview = missionNamespace getVariable ["grad_vehicleSpawner_localVeh",objNull];

private _textures = _preview getVariable ["grad_vehicleSpawner_textures",[]];
private _textureID = _textures find _configName;
if (_textureID >= 0) then {
    for [{_i=0}, {_i<(count _textures)-1}, {_i=_i+2}] do {
        _textures set [_i+1,0];
    };
    _textures set [_textureID + 1,1];
};

private _animations = _preview getVariable ["grad_vehicleSpawner_animations",[]];

[_preview,_textures,_animations,true] call BIS_fnc_initVehicle;

[_preview] call grad_vehicleSpawner_fnc_updateTexturesList;
