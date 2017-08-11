#include "component.hpp"

#include "..\..\dialog\defines.hpp"

params ["_display","_cgLeft"];

private _buttonCar = _display ctrlCreate ["grad_vehicleSpawner_rscCategoryButton",IDC_SELECTIONBUTTONCAR,_cgLeft];
_buttonCar ctrlSetPosition [0 * BUTTON_W,0,BUTTON_W,BUTTON_H];
_buttonCar ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGarage\Car_ca.paa";
_buttonCar ctrlAddEventHandler ["ButtonClick",{[_this select 0,0] call grad_vehicleSpawner_fnc_onSelectionTabChanged}];
_buttonCar ctrlSetTooltip "Wheeled";
_buttonCar ctrlCommit 0;

private _selectionListCar = _display ctrlCreate ["grad_vehicleSpawner_rscListBox",IDC_SELECTIONLISTCAR,_cgLeft];
_selectionListCar ctrlSetPosition [0,SELECTIONLIST_Y,SIDEBAR_W,SELECTIONLIST_H];
_selectionListCar ctrlAddEventHandler ["LBSelChanged",{[_this select 0,_this select 1,0] call grad_vehicleSpawner_fnc_onSelectionChanged}];
_selectionListCar ctrlCommit 0;

private _buttonTracked = _display ctrlCreate ["grad_vehicleSpawner_rscCategoryButton",IDC_SELECTIONBUTTONTRACKED,_cgLeft];
_buttonTracked ctrlSetPosition [1 * BUTTON_W,0,BUTTON_W,BUTTON_H];
_buttonTracked ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGarage\Tank_ca.paa";
_buttonTracked ctrlAddEventHandler ["ButtonClick",{[_this select 0,1] call grad_vehicleSpawner_fnc_onSelectionTabChanged}];
_buttonTracked ctrlSetTooltip "Tracked";
_buttonTracked ctrlCommit 0;

private _selectionListTracked = _display ctrlCreate ["grad_vehicleSpawner_rscListBox",IDC_SELECTIONLISTTRACKED,_cgLeft];
_selectionListTracked ctrlSetPosition [0,SELECTIONLIST_Y,SIDEBAR_W,SELECTIONLIST_H];
_selectionListTracked ctrlAddEventHandler ["LBSelChanged",{[_this select 0,_this select 1,1] call grad_vehicleSpawner_fnc_onSelectionChanged}];
_selectionListTracked ctrlCommit 0;

private _buttonHeli = _display ctrlCreate ["grad_vehicleSpawner_rscCategoryButton",IDC_SELECTIONBUTTONHELI,_cgLeft];
_buttonHeli ctrlSetPosition [2 * BUTTON_W,0,BUTTON_W,BUTTON_H];
_buttonHeli ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGarage\Helicopter_ca.paa";
_buttonHeli ctrlAddEventHandler ["ButtonClick",{[_this select 0,2] call grad_vehicleSpawner_fnc_onSelectionTabChanged}];
_buttonHeli ctrlSetTooltip "Rotary Wing";
_buttonHeli ctrlCommit 0;

private _selectionListHeli = _display ctrlCreate ["grad_vehicleSpawner_rscListBox",IDC_SELECTIONLISTHELI,_cgLeft];
_selectionListHeli ctrlSetPosition [0,SELECTIONLIST_Y,SIDEBAR_W,SELECTIONLIST_H];
_selectionListHeli ctrlAddEventHandler ["LBSelChanged",{[_this select 0,_this select 1,2] call grad_vehicleSpawner_fnc_onSelectionChanged}];
_selectionListHeli ctrlCommit 0;

private _buttonPlane = _display ctrlCreate ["grad_vehicleSpawner_rscCategoryButton",IDC_SELECTIONBUTTONPLANE,_cgLeft];
_buttonPlane ctrlSetPosition [3 * BUTTON_W,0,BUTTON_W,BUTTON_H];
_buttonPlane ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGarage\Plane_ca.paa";
_buttonPlane ctrlAddEventHandler ["ButtonClick",{[_this select 0,3] call grad_vehicleSpawner_fnc_onSelectionTabChanged}];
_buttonPlane ctrlSetTooltip "Fixed Wing";
_buttonPlane ctrlCommit 0;

private _selectionListPlane = _display ctrlCreate ["grad_vehicleSpawner_rscListBox",IDC_SELECTIONLISTPLANE,_cgLeft];
_selectionListPlane ctrlSetPosition [0,SELECTIONLIST_Y,SIDEBAR_W,SELECTIONLIST_H];
_selectionListPlane ctrlAddEventHandler ["LBSelChanged",{[_this select 0,_this select 1,3] call grad_vehicleSpawner_fnc_onSelectionChanged}];
_selectionListPlane ctrlCommit 0;

private _buttonBoat = _display ctrlCreate ["grad_vehicleSpawner_rscCategoryButton",IDC_SELECTIONBUTTONBOAT,_cgLeft];
_buttonBoat ctrlSetPosition [4 * BUTTON_W,0,BUTTON_W,BUTTON_H];
_buttonBoat ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGarage\Naval_ca.paa";
_buttonBoat ctrlAddEventHandler ["ButtonClick",{[_this select 0,4] call grad_vehicleSpawner_fnc_onSelectionTabChanged}];
_buttonBoat ctrlSetTooltip "Naval";
_buttonBoat ctrlCommit 0;

private _selectionListBoat = _display ctrlCreate ["grad_vehicleSpawner_rscListBox",IDC_SELECTIONLISTBOAT,_cgLeft];
_selectionListBoat ctrlSetPosition [0,SELECTIONLIST_Y,SIDEBAR_W,SELECTIONLIST_H];
_selectionListBoat ctrlAddEventHandler ["LBSelChanged",{[_this select 0,_this select 1,4] call grad_vehicleSpawner_fnc_onSelectionChanged}];
_selectionListBoat ctrlCommit 0;

private _selectionIndicator = _display ctrlCreate ["RscBackground",IDC_SELECTIONINDICATOR,_cgLeft];
_selectionIndicator ctrlSetPosition [0 * BUTTON_W,BUTTON_H,BUTTON_W,INDICATOR_H];
_selectionIndicator ctrlSetBackgroundColor [0,1,0,0.5];
_selectionIndicator ctrlCommit 0;

private _buttonSpawn = _display ctrlCreate ["grad_vehicleSpawner_rscSpawnButton",IDC_BUTTONSPAWN,_cgLeft];
_buttonSpawn ctrlSetPosition [0,safeZoneH - BUTTONSPAWN_H,SIDEBAR_W,BUTTONSPAWN_H];
_buttonSpawn ctrlSetText "SPAWN";
_buttonSpawn ctrlAddEventHandler ["ButtonClick",{[_this select 0] call grad_vehicleSpawner_fnc_onButtonSpawn}];
_buttonSpawn ctrlEnable false;
_buttonSpawn ctrlCommit 0;
