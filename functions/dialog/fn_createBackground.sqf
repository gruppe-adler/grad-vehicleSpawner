#include "component.hpp"

#include "..\..\dialog\defines.hpp"

params ["_display","_cgLeft","_cgRight"];

private _backgroundL = _display ctrlCreate ["RscBackground",-1,_cgLeft];
_backgroundL ctrlSetPosition [0,0,SIDEBAR_W,BACKGROUND_H];
_backgroundL ctrlSetBackgroundColor [COLOR_BACKGROUND];
_backgroundL ctrlCommit 0;

private _backgroundR = _display ctrlCreate ["RscBackground",-1,_cgRight];
_backgroundR ctrlSetPosition [0,0,SIDEBAR_W,BACKGROUND_H];
_backgroundR ctrlSetBackgroundColor [COLOR_BACKGROUND];
_backgroundR ctrlCommit 0;
