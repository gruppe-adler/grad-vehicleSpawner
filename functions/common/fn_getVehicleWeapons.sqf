#include "component.hpp"

params ["_class"];

private _cfg = configFile >> "cfgVehicles" >> _class;
if (!isClass _cfg) exitWith {[]};

private _weapons = [];
_weapons append ([_cfg,"weapons",[]] call BIS_fnc_returnConfigEntry);


private _fnc_addTurretWeapons = {
    params ["_turretCfg"];

    _weapons append ([_turretCfg,"weapons",[]] call BIS_fnc_returnConfigEntry);
    private _subTurrets = "true" configClasses (_turretCfg >> "Turrets");
    {[_x] call _fnc_addTurretWeapons;false} count _subTurrets;
};
private _turrets = "true" configClasses (_cfg >> "Turrets");
{[_x] call _fnc_addTurretWeapons; false} count _turrets;

_weapons = _weapons - ["TruckHorn","TruckHorn2","TruckHorn3","SportCarHorn","CarHorn"];

private _weaponDisplayNames = [];
{
    _cfg = configFile >> "CfgWeapons" >> _x;
    _displayName = [_cfg,"displayName",""] call BIS_fnc_returnConfigEntry;
    if (_displayName != "") then {
        _weaponDisplayNames pushBack _displayName;
    };
    false
} count _weapons;

_weaponDisplayNames
