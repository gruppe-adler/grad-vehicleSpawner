#include "component.hpp"

#include "..\..\dialog\defines.hpp"

params ["_camObj"];

//adjust cam distance for new preview size
private _sizeOld = missionNamespace getVariable [QGVAR(sizeOld),0];
private _sizeNew = ((boundingboxreal _camObj select 0) vectordistance (boundingboxreal _camObj select 1));
if (_sizeOld == 0) then {_sizeOld = _sizeNew};
missionNamespace setVariable [QGVAR(sizeOld),_sizeNew];

GVAR(camProperties) params ["_dis"];
GVAR(camProperties) set [0,_dis * (_sizeNew/_sizeOld)];
GVAR(camProperties) set [4,_camObj];

if (!isNull GVAR(target)) then {
    detach GVAR(target);
    GVAR(target) attachto [_camObj,GVAR(camProperties) select 3,""];
} else {
    GVAR(target) = createagent ["Logic",getPos _camObj,[],0,"NONE"];
    GVAR(target) attachto [_camObj,GVAR(camProperties) select 3,""];
};

[] call FUNC(updateCamera);

private _display = uiNamespace getVariable [QGVAR(display),displayNull];
private _enableButtons = _camObj in (missionNamespace getVariable [QGVAR(myVehicles),[]]);
{(_display displayCtrl _x) ctrlEnable _enableButtons; false} count [IDC_BUTTONMOUNT,IDC_BUTTONDELETE];
