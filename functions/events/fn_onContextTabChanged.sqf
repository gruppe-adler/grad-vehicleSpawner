#include "component.hpp"

#include "..\..\dialog\defines.hpp"

params ["_buttonCtrl","_buttonID"];

grad_vehicleSpawner_currentContextTabID = _buttonID;

private _display = uiNamespace getVariable ["grad_vehicleSpawner_display",displayNull];
if (isNull _display) exitWith {ERROR("Selection changed - display is null.")};

private _contextIndicator = _display displayCtrl IDC_CONTEXTINDICATOR;
_contextIndicator ctrlSetPosition [_buttonID * BUTTONCONTEXT_W,BUTTON_H,BUTTONCONTEXT_W,INDICATOR_H];
_contextIndicator ctrlCommit 0;

{
    _active = _x == (IDC_INFO + _buttonID);
    _ctrlList = _display displayCtrl _x;
    _ctrlList ctrlEnable _active;
    _ctrlList ctrlSetfade ([1,0] select _active);
    _ctrlList ctrlCommit 0;

    _active = _active && {lbSize _ctrlList == 0};
    _ctrlDisabled = _display displayCtrl (_forEachIndex + IDC_INFODISABLED);
    _ctrlDisabled ctrlEnable _active;
    _ctrlDisabled ctrlSetfade ([1,0] select _active);
    _ctrlDisabled ctrlCommit 0;

} forEach [IDCS_CONTEXTTABS];
