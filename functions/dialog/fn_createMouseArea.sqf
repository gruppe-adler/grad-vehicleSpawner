#include "component.hpp"

#include "..\..\dialog\defines.hpp"

params ["_display"];

private _mouseArea = _display ctrlCreate ["grad_vehicleSpawner_rscMouseArea",-1];
_mouseArea ctrlSetPosition [safeZoneX + SIDEBAR_W,safeZoneY,safeZoneW - 2 * SIDEBAR_W,safeZoneH];
_mouseArea ctrlSetBackgroundColor [0,0,0,0];
_mouseArea ctrlCommit 0;

_mouseArea ctrlAddEventHandler ["MouseMoving",{_this call grad_vehicleSpawner_fnc_onMouseMoving}];
_mouseArea ctrlAddEventHandler ["MouseEnter",{[true] call grad_vehicleSpawner_fnc_onMouseOverSidebar}];
_mouseArea ctrlAddEventHandler ["MouseExit",{[false] call grad_vehicleSpawner_fnc_onMouseOverSidebar}];

_mouseArea
