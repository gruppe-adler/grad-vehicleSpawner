#include "component.hpp"

params ["_ctrlListAnimations","_selID"];

private _configName = _ctrlListAnimations lbData _selID;

private _selVeh = missionNamespace getVariable ["grad_vehicleSpawner_selVeh",objNull];
private _myVehicles = missionNamespace getVariable ["grad_vehicleSpawner_myVehicles",[]];
if (_selVeh in _myVehicles) exitWith {};

private _animations = _selVeh getVariable ["grad_vehicleSpawner_animations",[]];
private _animationID = _animations find _configName;
if (_animationID >= 0) then {
    _animations set [_animationID + 1,([1,0] find (_selVeh animationPhase _configName))];
};

private _textures = _selVeh getVariable ["grad_vehicleSpawner_textures",[]];
[_selVeh,_textures,_animations,true] call BIS_fnc_initVehicle;

[_selVeh] call grad_vehicleSpawner_fnc_updateAnimationList;
