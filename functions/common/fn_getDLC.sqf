#include "component.hpp"


params ["_cfg"];

private _dlc = "";
private _addons = configsourceaddonlist _cfg;
if (count _addons > 0) then {
    private _mods = configsourcemodlist (configfile >> "CfgPatches" >> _addons select 0);
    if (count _mods > 0) then {
        _dlc = _mods select 0;
    };
};
_dlc
