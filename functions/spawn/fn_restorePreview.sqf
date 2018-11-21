#include "component.hpp"

private _previousPreview = missionNamespace getVariable [QGVAR(previousPreview),objNull];
if (isNull _previousPreview) exitWith {};

_previousPreview setPosASL (_previousPreview getVariable [QGVAR(previousPosASL),[0,0,0]]);
GVAR(localVeh) = _previousPreview;
missionNamespace setVariable [QGVAR(previousPreview),objNull];

[true] call FUNC(enableSpawnButton);

[_previousPreview] call FUNC(onNewVehicleSelected);
