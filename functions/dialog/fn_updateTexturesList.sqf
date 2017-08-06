#include "component.hpp"

#include "..\..\dialog\defines.hpp"

params ["_preview",["_cfg",missionNamespace getVariable ["grad_vehicleSpawner_currentVehicleCfg",configNull]]];

private _display = uiNamespace getVariable ["grad_vehicleSpawner_display",displayNull];

private _checkboxTextures = [
    tolower gettext (configfile >> "RscCheckBox" >> "textureUnchecked"),
    tolower gettext (configfile >> "RscCheckBox" >> "textureChecked")
];

private _textures = _preview getVariable ["grad_vehicleSpawner_textures",[]];
private _currentID = _textures find 1;
private _ctrlListTextures = _display displayCtrl IDC_LISTTEXTURES;
lbclear _ctrlListTextures;
{
    _displayName = gettext (_x >> "displayName");
    if (_displayName != "") then {
        _configName = configname _x;
        _lbAdd = _ctrlListTextures lbadd _displayName;
        _ctrlListTextures lbsetdata [_lbAdd,_configName];
        _isCurrent = (_textures find _configName) + 1 == _currentID;
        _ctrlListTextures lbsetpicture [_lbAdd,_checkboxTextures select _isCurrent];
    };
} foreach (configproperties [_cfg >> "textureSources","isclass _x",true]);
lbsort _ctrlListTextures;

private _ctrlListTexturesDisabled = _display displayCtrl IDC_LISTTEXTURESDISABLED;
_ctrlListTexturesDisabled ctrlshow (lbsize _ctrlListTextures == 0);
