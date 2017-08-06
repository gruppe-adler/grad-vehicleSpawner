#include "component.hpp"

params ["_tabID","_cfg","_class"];

private _preview = missionNamespace getVariable ["grad_vehicleSpawner_localVeh",objNull];
private _spawnPos = grad_vehicleSpawner_spawnPositions select _tabID;
private _spawnDir = if (count _spawnPos > 3) then {_spawnPos deleteAt 3} else {0};
private _sizeOld = ((boundingboxreal _preview select 0) vectordistance (boundingboxreal _preview select 1));

deleteVehicle _preview;

_preview = _class createVehicleLocal [0,0,0];
_preview enableSimulation false;
_preview setDir _spawnDir;
_preview setPos _spawnPos;
grad_vehicleSpawner_localVeh = _preview;

//adjust cam distance for new preview size
private _sizeNew = ((boundingboxreal _preview select 0) vectordistance (boundingboxreal _preview select 1));
if (_sizeOld == 0) then {_sizeOld = _sizeNew};

grad_vehicleSpawner_camProperties params ["_dis"];
grad_vehicleSpawner_camProperties set [0,_dis * (_sizeNew/_sizeOld)];

grad_vehiclespawner_target = createagent ["Logic",getPos _preview,[],0,"NONE"];
grad_vehiclespawner_target attachto [_preview,grad_vehicleSpawner_camProperties select 3,""];

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

_preview setVariable ["grad_vehicleSpawner_textures",_textures];

_preview
