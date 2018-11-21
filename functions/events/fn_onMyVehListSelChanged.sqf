#include "component.hpp"

#include "..\..\dialog\defines.hpp"

params ["_ctrlList","_selID"];

if (_selID < 0) exitWith {};

private _myVehicles = missionNamespace getVariable ["grad_vehicleSpawner_myVehicles",[]];
if (count _myVehicles == 0) exitWith {};
if (_selID > (count _myVehicles)-1) exitWith {};

private _selVehicle = _myVehicles select _selID;
grad_vehicleSpawner_selVeh = _selVehicle;
[_selVehicle] call grad_vehicleSpawner_fnc_setCamTarget;

[nil,false] call grad_vehicleSpawner_fnc_deletePreview;

private _vehClass = typeOf _selVehicle;
private _cfg = configFile >> "CfgVehicles" >> _vehClass;

[] call grad_vehicleSpawner_fnc_updateInformation;
[] call grad_vehicleSpawner_fnc_updateAnimationList;
[] call grad_vehicleSpawner_fnc_updateTexturesList;
[] call grad_vehicleSpawner_fnc_updatePylonsList;

private _display = uiNamespace getVariable ["grad_vehicleSpawner_display",displayNull];
{
    private _ctrlList = _display displayCtrl _x;
    _ctrlList lbSetCurSel -1;
    false
} count [IDCS_SELECTIONTABS];


private _mountBlocked = ([typeof _selVehicle,true] call BIS_fnc_crewCount == count crew _selVehicle) || ([configFile >> "cfgVehicles" >> typeOf _selVehicle,"isUAV",0] call BIS_fnc_returnConfigEntry == 1);
if (_mountBlocked) then {
    (_display displayCtrl IDC_BUTTONMOUNT) ctrlEnable false;
};
