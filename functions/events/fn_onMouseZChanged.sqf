#include "component.hpp"

params ["_ctrlMouseArea","_mouseZ"];

if !(missionNamespace getVariable ["grad_vehicleSpawner_mouseOverArea",false]) exitWith {};

grad_vehicleSpawner_camProperties params ["_dis"];
grad_vehicleSpawner_camProperties set [0,((_dis - _mouseZ) max 2) min 50];

[missionNamespace getVariable ["grad_vehicleSpawner_localVeh",objNull]] call grad_vehicleSpawner_fnc_updateCamera;
