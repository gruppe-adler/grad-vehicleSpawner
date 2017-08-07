#include "component.hpp"

#include "..\..\dialog\defines.hpp"

params ["_display","_cgRight"];

private _header = _display ctrlCreate ["RscText",-1,_cgRight];
_header ctrlSetPosition [0,MYVEHICLEINFO_Y,SIDEBAR_W,BUTTON_H];
_header ctrlSetBackgroundColor [0,0,0,1];
_header ctrlSetText "MY VEHICLES";
_header ctrlCommit 0;

private _listMyVehicles = _display ctrlCreate ["grad_vehicleSpawner_rscListBox",IDC_LISTMYVEHICLES,_cgRight];
_listMyVehicles ctrlSetPosition [0,MYVEHLIST_Y,SIDEBAR_W,MYVEHLIST_H];
_listMyVehicles ctrlAddEventHandler ["LBSelChanged",{_this call grad_vehicleSpawner_fnc_onMyVehListSelChanged}];
_listMyVehicles ctrlCommit 0;

private _buttonMount = _display ctrlCreate ["grad_vehicleSpawner_rscSpawnButton",IDC_BUTTONMOUNT,_cgRight];
_buttonMount ctrlSetPosition [0,safeZoneH - BUTTONSPAWN_H,BUTTONRIGHT_W,BUTTONSPAWN_H];
_buttonMount ctrlSetText "MOUNT";
_buttonMount ctrlAddEventHandler ["ButtonClick",{[_this select 0] call grad_vehicleSpawner_fnc_onButtonMount}];
_buttonMount ctrlEnable false;
_buttonMount ctrlCommit 0;

private _buttonDelete = _display ctrlCreate ["grad_vehicleSpawner_rscDeleteButton",IDC_BUTTONDELETE,_cgRight];
_buttonDelete ctrlSetPosition [BUTTONRIGHT2_X,safeZoneH - BUTTONSPAWN_H,BUTTONRIGHT_W,BUTTONSPAWN_H];
_buttonDelete ctrlSetText "DELETE";
_buttonDelete ctrlAddEventHandler ["ButtonClick",{[_this select 0] call grad_vehicleSpawner_fnc_onButtonDelete}];
_buttonDelete ctrlEnable false;
_buttonDelete ctrlCommit 0;
