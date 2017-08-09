#include "component.hpp"

#include "..\..\dialog\defines.hpp"

params ["_tabID","_cfg","_class"];

private _preview = missionNamespace getVariable ["grad_vehicleSpawner_localVeh",objNull];
private _spawnPos = grad_vehicleSpawner_spawnPositions select _tabID;
private _spawnDir = if (count _spawnPos > 3) then {_spawnPos deleteAt 3} else {0};

[_preview] call grad_vehicleSpawner_fnc_deletePreview;

_spawnPos params ["_x","_y",["_z",0],["_dir",0]];
private _actualSpawnPos = [[_x,_y,_z],_class] call grad_vehicleSpawner_fnc_findEmptyPosition;

_preview = _class createVehicleLocal [0,0,0];
_preview enableSimulation false;
_preview setDir _spawnDir;
_preview setPos _actualSpawnPos;
grad_vehicleSpawner_localVeh = _preview;

private _display = uiNamespace getVariable ["grad_vehicleSpawner_display",displayNull];
if (!isNull _display) then {
    private _spawnButton = _display displayCtrl IDC_BUTTONSPAWN;
    _spawnButton ctrlEnable true;
};

[_preview] call grad_vehicleSpawner_fnc_setCamTarget;

private _animationSources = configproperties [_cfg >> "animationSources","isclass _x",true];
private _animations = [];
{
    _displayName = gettext (_x >> "displayName");
    if (_displayName != "" && {getnumber (_x >> "scope") > 1 || !isnumber (_x >> "scope")}) then {
        _configName = configName _x;
        _animations pushBack (configName _x);
        _animations pushBack (_preview animationphase _configName);
    };
    false
} count _animationSources;
_preview setVariable ["grad_vehicleSpawner_animations",_animations];


private _textureSources = configproperties [_cfg >> "textureSources","isclass _x",true];
private _textures = [];
{
    _displayName = gettext (_x >> "displayName");
    if (_displayName != "") then {
        _textures pushBack (configName _x);
        if (_foreachindex == 0) then {_textures pushBack 1} else {_textures pushBack 0};
    };
} forEach _textureSources;

[_preview,_textures,_animations,true] call BIS_fnc_initVehicle;

_preview setVariable ["grad_vehicleSpawner_textures",_textures];

_preview
