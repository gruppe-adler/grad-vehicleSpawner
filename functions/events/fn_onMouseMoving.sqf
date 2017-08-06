#include "component.hpp"

params ["_ctrlMouseArea","_mouseX","_mouseY","_mouseOver"];

grad_vehicleSpawner_mouseOverArea = _mouseOver;

if !(grad_vehicleSpawner_rMouseDown) exitWith {
    grad_vehicleSpawner_oldMouseCoords = [_mouseX,_mouseY];
};
if (isNil "grad_vehicleSpawner_oldMouseCoords") exitWith {
    grad_vehicleSpawner_oldMouseCoords = [_mouseX,_mouseY];
};

grad_vehicleSpawner_oldMouseCoords params ["_mouseXOld","_mouseYOld"];
grad_vehicleSpawner_camProperties params ["_dis","_dirH","_dirV","_targetPos"];

_dX = (_mouseXOld - _mouseX) * 0.75;
_dY = (_mouseYOld - _mouseY) * 0.75;
_targetPos = [
    [0,0,_targetPos select 2],
    [[0,0,0],_targetPos] call bis_fnc_distance2D,
    ([[0,0,0],_targetPos] call bis_fnc_dirto) - _dX * 180
] call bis_fnc_relpos;

grad_vehicleSpawner_camProperties set [1,(_dirH - _dX * 180) % 360];
grad_vehicleSpawner_camProperties set [2,(_dirV - _dY * 100) max -89 min 89];
grad_vehicleSpawner_camProperties set [3,_targetPos];

grad_vehicleSpawner_oldMouseCoords = [_mouseX,_mouseY];

[missionNamespace getVariable ["grad_vehicleSpawner_localVeh",objNull]] call grad_vehicleSpawner_fnc_updateCamera;
