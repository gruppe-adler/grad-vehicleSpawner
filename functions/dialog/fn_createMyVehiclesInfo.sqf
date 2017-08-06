#include "component.hpp"

#include "..\..\dialog\defines.hpp"

params ["_display","_cgRight"];

private _header = _display ctrlCreate ["RscText",-1,_cgRight];
_header ctrlSetPosition [0,MYVEHICLEINFO_Y,SIDEBAR_W,BUTTON_H];
_header ctrlSetBackgroundColor [0,0,0,1];
_header ctrlSetText "MY VEHICLES";
_header ctrlCommit 0;
