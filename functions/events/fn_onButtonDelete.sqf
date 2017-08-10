#include "component.hpp"

#include "..\..\dialog\defines.hpp"

params ["_buttonCtrl"];

private _display = uiNamespace getVariable ["grad_vehicleSpawner_display",displayNull];
if (isNull _display) exitWith {};

/*private _ctrlMyVehicleList = _display displayCtrl IDC_LISTMYVEHICLES;
private _selID = lbCurSel _ctrlMyVehicleList;
if (_selID < 0) exitWith {};

private _myVehicles = missionNamespace getVariable ["grad_vehicleSpawner_myVehicles",[]];
if (count _myVehicles == 0) exitWith {};
if (_selID > (count _myVehicles)-1) exitWith {};

private _selVehicle = _myVehicles select _selID;*/

private _selVehicle = grad_vehicleSpawner_camProperties param [4,objNull];
[_selVehicle] remoteExec ["grad_vehicleSpawner_fnc_deleteVehicle",2,false];

{(_display displayCtrl _x) ctrlEnable false; false} count [IDC_BUTTONMOUNT,IDC_BUTTONDELETE];

grad_vehicleSpawner_selVeh = objNull;

[] call grad_vehicleSpawner_fnc_updateInformation;
[] call grad_vehicleSpawner_fnc_updateAnimationList;
[] call grad_vehicleSpawner_fnc_updateTexturesList;
