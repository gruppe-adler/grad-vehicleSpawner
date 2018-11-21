#include "component.hpp"
#include "..\..\dialog\defines.hpp"

params [["_newVehicle",objNull]];

GVAR(selVeh) = _newVehicle;

[] call FUNC(updateInformation);
[] call FUNC(updateAnimationList);
[] call FUNC(updateTexturesList);
[] call FUNC(updatePylonsList);
[controlNull,missionNamespace getVariable [QGVAR(currentContextTabID),-1]] call FUNC(onContextTabChanged);

private _display = uiNamespace getVariable [QGVAR(display),displayNull];
private _ctrlMyVehList = _display displayCtrl IDC_LISTMYVEHICLES;
_ctrlMyVehList lbSetCurSel -1;
