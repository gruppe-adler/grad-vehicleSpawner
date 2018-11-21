#include "component.hpp"
#include "..\..\dialog\defines.hpp"

params [["_text",""],["_sound",""]];

private _display = uiNamespace getVariable [QGVAR(display),displayNull];
if (isNull _display) exitWith {};

private _ctrlMessage = _display displayCtrl IDC_MESSAGE;
if (isNull _ctrlMessage) exitWith {};

_ctrlMessage ctrlSetText _text;
_ctrlMessage ctrlSetFade 0;
_ctrlMessage ctrlCommit 0;

[{
    params ["_ctrlMessage","_text"];

    if (isNull _ctrlMessage) exitWith {};

    // check if another message has overwritten this one
    if (ctrlText _ctrlMessage != _text) exitWith {};

    _ctrlMessage ctrlSetFade 1;
    _ctrlMessage ctrlCommit 1;
},[_ctrlMessage,_text],3] call CBA_fnc_waitAndExecute;

if (_sound != "") then {
    playSound _sound;
};
