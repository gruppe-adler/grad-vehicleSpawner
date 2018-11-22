#include "component.hpp"

#include "..\..\dialog\defines.hpp"

params ["_tabID","_cfg","_vehClass"];

private _preview = missionNamespace getVariable ["grad_vehicleSpawner_localVeh",objNull];
private _spawnPos = grad_vehicleSpawner_spawnPositions select _tabID;

[_preview,false] call grad_vehicleSpawner_fnc_deletePreview;

([_spawnPos,_vehClass] call FUNC(findEmptySpawnPosition)) params ["_actualSpawnPos",["_dir",0]];

if (_actualSpawnPos isEqualTo [0,0,0]) exitWith {
    ["Error: Could not find a spawn position!","3DEN_notificationWarning"] call FUNC(showMessage);
    objNull
};

_preview = _vehClass createVehicleLocal [0,0,0];
_preview enableSimulation false;
_preview setDir _dir;
_preview setPos _actualSpawnPos;
grad_vehicleSpawner_localVeh = _preview;

[true] call FUNC(enableSpawnButton);
[_preview] call FUNC(setCamTarget);

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
        if (_forEachIndex == 0) then {_textures pushBack 1} else {_textures pushBack 0};
    };
} forEach _textureSources;

[_preview,_textures,_animations,true] call BIS_fnc_initVehicle;

_preview setVariable ["grad_vehicleSpawner_textures",_textures];

_preview
