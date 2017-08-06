#include "component.hpp"

#include "..\..\dialog\defines.hpp"

params ["_preview",["_cfg",missionNamespace getVariable ["grad_vehicleSpawner_currentVehicleCfg",configNull]]];

private _display = uiNamespace getVariable ["grad_vehicleSpawner_display",displayNull];

private _checkboxTextures = [
    tolower gettext (configfile >> "RscCheckBox" >> "textureUnchecked"),
    tolower gettext (configfile >> "RscCheckBox" >> "textureChecked")
];

private _ctrlListAnimations = _display displayCtrl IDC_LISTANIMATION;
lbclear _ctrlListAnimations;
{
    _configName = configname _x;
    _displayName = gettext (_x >> "displayName");
    if (_displayName != "" && {getnumber (_x >> "scope") > 1 || !isnumber (_x >> "scope")}) then {
        _lbAdd = _ctrlListAnimations lbadd _displayName;
        _ctrlListAnimations lbsetdata [_lbAdd,_configName];
        _ctrlListAnimations lbsetpicture [_lbAdd,_checkboxTextures select ((_preview animationphase _configName) max 0)];
    };
    false
} count (configproperties [_cfg >> "animationSources","isclass _x",true]);
lbsort _ctrlListAnimations;
private _ctrlListAnimationsDisabled = _display displayCtrl IDC_LISTANIMATIONDISABLED;
_ctrlListAnimationsDisabled ctrlshow (lbsize _ctrlListAnimations == 0);
