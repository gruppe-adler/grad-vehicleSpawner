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

[] call grad_vehicleSpawner_fnc_deletePreview;

private _vehClass = typeOf _selVehicle;
private _cfg = configFile >> "CfgVehicles" >> _vehClass;

[] call grad_vehicleSpawner_fnc_updateInformation;
[] call grad_vehicleSpawner_fnc_updateAnimationList;
[] call grad_vehicleSpawner_fnc_updateTexturesList;
