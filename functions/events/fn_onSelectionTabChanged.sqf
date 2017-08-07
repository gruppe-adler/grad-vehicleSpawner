#include "component.hpp"

#include "..\..\dialog\defines.hpp"

params ["_buttonCtrl","_buttonID"];

grad_vehicleSpawner_currentSelTabID = _buttonID;

private _display = uiNamespace getVariable ["grad_vehicleSpawner_display",displayNull];
if (isNull _display) exitWith {ERROR("Selection changed - display is null.")};

private _selectionIndicator = _display displayCtrl IDC_SELECTIONINDICATOR;
_selectionIndicator ctrlSetPosition [_buttonID * BUTTON_W,BUTTON_H,BUTTON_W,INDICATOR_H];
_selectionIndicator ctrlCommit 0;

{
    _active = _x == IDC_SELECTIONLISTCAR + _buttonID;
    _ctrlList = _display displayCtrl _x;
    _ctrlList ctrlEnable _active;
    _ctrlList ctrlSetfade ([1,0] select _active);
    _ctrlList ctrlCommit 0;
} count [IDCS_SELECTIONTABS];
