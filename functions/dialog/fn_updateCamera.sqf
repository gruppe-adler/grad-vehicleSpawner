#include "component.hpp"

private _cam = missionNamespace getVariable ["grad_vehicleSpawner_cam",objNull];
if (isNull _cam) exitWith {ERROR("Update camera - camera is null.")};

private _target = missionNamespace getVariable ["grad_vehiclespawner_target",objNull];
grad_vehicleSpawner_camProperties params ["_dis","_dirH","_dirV","_targetPos",["_camObj",objNull]];

[_target,[_dirH + 180,-_dirV,0]] call bis_fnc_setobjectrotation;
_target attachto [_camObj,_targetPos,""];

_cam setpos (_target modeltoworld [0,-_dis,0]);
_cam setvectordirandup [vectordir _target,vectorup _target];

//--- Make sure the camera is not underground
if ((getposasl _cam select 2) < (getposasl _camObj select 2)) then {
    _disCoef = ((getposasl _target select 2) - (getposasl _camObj select 2)) / ((getposasl _target select 2) - (getposasl _cam select 2) + 0.001);
    _cam setpos (_target modeltoworldvisual [0,-_dis * _disCoef,0]);
};

_cam camCommit 0;
