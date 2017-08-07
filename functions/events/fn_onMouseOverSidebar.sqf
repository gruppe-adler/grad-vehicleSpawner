#include "component.hpp"

#include "..\..\dialog\defines.hpp"

params ["_mouseEntered"];

private _display = uiNamespace getVariable ["grad_vehicleSpawner_display",displayNull];
private _cgLeft = _display displayCtrl IDC_CGLEFT;
private _cgRight = _display displayCtrl IDC_CGRIGHT;

private _fade = [0,SIDEBAR_FADE] select _mouseEntered;
_cgLeft ctrlSetFade _fade;
_cgRight ctrlSetFade _fade;

private _fadeTime = [SIDEBAR_FADEIN,SIDEBAR_FADEOUT] select _mouseEntered;
_cgLeft ctrlCommit _fadeTime;
_cgRight ctrlCommit _fadeTime;
