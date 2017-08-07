#include "component.hpp"

#include "..\..\dialog\defines.hpp"

params ["_camObj"];

//adjust cam distance for new preview size
private _sizeOld = missionNamespace getVariable ["grad_vehicleSpawner_sizeOld",0];
private _sizeNew = ((boundingboxreal _camObj select 0) vectordistance (boundingboxreal _camObj select 1));
if (_sizeOld == 0) then {_sizeOld = _sizeNew};
missionNamespace setVariable ["grad_vehicleSpawner_sizeOld",_sizeNew];

grad_vehicleSpawner_camProperties params ["_dis"];
grad_vehicleSpawner_camProperties set [0,_dis * (_sizeNew/_sizeOld)];
grad_vehicleSpawner_camProperties set [4,_camObj];

grad_vehiclespawner_target = createagent ["Logic",getPos _camObj,[],0,"NONE"];
grad_vehiclespawner_target attachto [_camObj,grad_vehicleSpawner_camProperties select 3,""];

[] call grad_vehicleSpawner_fnc_updateCamera;

private _display = uiNamespace getVariable ["grad_vehicleSpawner_display",displayNull];
private _enableButtons = _camObj in (missionNamespace getVariable ["grad_vehicleSpawner_myVehicles",[]]);
{(_display displayCtrl _x) ctrlEnable _enableButtons; false} count [IDC_BUTTONMOUNT,IDC_BUTTONDELETE];
