#include "component.hpp"

params ["_ctrlListAnimations","_selID"];

private _configName = _ctrlListAnimations lbData _selID;

private _preview = missionNamespace getVariable ["grad_vehicleSpawner_localVeh",objNull];

private _animations = _preview getVariable ["grad_vehicleSpawner_animations",[]];
private _animationID = _animations find _configName;
if (_animationID >= 0) then {
    _animations set [_animationID + 1,([1,0] find (_preview animationPhase _configName))];
};

private _textures = _preview getVariable ["grad_vehicleSpawner_textures",[]];
[_preview,_textures,_animations,true] call BIS_fnc_initVehicle;

[_preview] call grad_vehicleSpawner_fnc_updateAnimationList;
