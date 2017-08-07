#include "component.hpp"

#include "..\..\dialog\defines.hpp"

params ["_buttonCtrl"];

private _display = uiNamespace getVariable ["grad_vehicleSpawner_display",displayNull];
if (isNull _display) exitWith {};

private _ctrlMyVehicleList = _display displayCtrl IDC_LISTMYVEHICLES;
private _selID = lbCurSel _ctrlMyVehicleList;
if (_selID < 0) exitWith {};

private _myVehicles = missionNamespace getVariable ["grad_vehicleSpawner_myVehicles",[]];
if (count _myVehicles == 0) exitWith {};
if (_selID > (count _myVehicles)-1) exitWith {};

private _selVehicle = _myVehicles select _selID;

_display closeDisplay 0;

player moveinAny _selVehicle;
