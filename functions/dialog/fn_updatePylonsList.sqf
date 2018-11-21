/*  Updates pylons controlsgroup with one combobox for each pylon
*   Heavily inspired by ace_pylons / 654wak654
*/


#include "component.hpp"
#include "..\..\dialog\defines.hpp"

private _selVeh = missionNamespace getVariable ["grad_vehicleSpawner_selVeh",objNull];
private _cfg = if (isNull _selVeh) then {configNull} else {configFile >> "cfgVehicles" >> typeOf _selVeh};
private _cfgPylons = _cfg >> "Components" >> "TransportPylonsComponent";

private _display = uiNamespace getVariable ["grad_vehicleSpawner_display",displayNull];
private _ctrlListPylonsDisabled = _display displayCtrl IDC_LISTPYLONSDISABLED;
private _cgListPylons = _display displayCtrl IDC_LISTPYLONS;

{ctrlDelete _x} forEach (missionNamespace getVariable [QGVAR(pylonsComboBoxes),[]]);

private _aircraftWithPylons = missionNamespace getVariable ["ace_pylons_aircraftWithPylons",[]];
if !(typeOf _selVeh in _aircraftWithPylons) exitWith {
    _ctrlListPylonsDisabled ctrlshow true;
};
_ctrlListPylonsDisabled ctrlshow false;

private _pylonClasses = ("true" configClasses (_cfgPylons >> "Pylons"));
reverse _pylonClasses;

GVAR(pylonsComboBoxes) = [];
{
    private _ctrlCombo = _display ctrlCreate ["RscCombo",-1,_cgListPylons];
    _ctrlCombo ctrlSetPosition [PYLONSLIST_PADDING_X,_forEachIndex * (PYLONSLIST_COMBO_H + PYLONSLIST_PADDING_Y),PYLONSLIST_COMBO_W,PYLONSLIST_COMBO_H];
    _ctrlCombo ctrlCommit 0;

    _ctrlCombo lbAdd "---";
    _ctrlCombo lbSetData [0,""];
    _ctrlCombo lbSetValue [0,_forEachIndex];

    private _mag = (getPylonMagazines _selVeh) select _forEachIndex;
    private _mags = _selVeh getCompatiblePylonMagazines (_forEachIndex + 1);

    private _index = 0;
    {
        _ctrlCombo lbAdd getText (configFile >> "CfgMagazines" >> _x >> "displayName");
        _ctrlCombo lbSetData [_forEachIndex + 1, _x];

        if (_x == _mag) then {
            _index = _forEachIndex + 1;
        };
    } forEach _mags;

    _ctrlCombo lbSetCurSel _index;
    _ctrlCombo ctrlAddEventHandler ["LBSelChanged",FUNC(onPylonSelChanged)];

    GVAR(pylonsComboBoxes) pushBack _ctrlCombo;
} forEach _pylonClasses;
