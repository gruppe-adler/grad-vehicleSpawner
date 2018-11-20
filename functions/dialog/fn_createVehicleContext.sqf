#include "component.hpp"

#include "..\..\dialog\defines.hpp"

params ["_display","_cgRight"];

private _buttonInfo = _display ctrlCreate ["RscButtonArsenal",-1,_cgRight];
_buttonInfo ctrlSetPosition [0 * BUTTONCONTEXT_W,0,BUTTONCONTEXT_W,BUTTON_H];
_buttonInfo ctrlSetText "\A3\UI_f\data\GUI\Rsc\RscDisplayOptionsVideo\icon_performance.paa";
_buttonInfo ctrlAddEventHandler ["ButtonClick",{[_this select 0,0] call grad_vehicleSpawner_fnc_onContextTabChanged}];
_buttonInfo ctrlSetTooltip "Information";
_buttonInfo ctrlCommit 0;

private _infoCtrlGroup = _display ctrlCreate ["RscControlsGroupNoScrollbars",IDC_INFO,_cgRight];
_infoCtrlGroup ctrlSetPosition [0,CONTEXTAREA_Y,SIDEBAR_W,CONTEXTAREA_H];
_infoCtrlGroup ctrlCommit 0;

private _infoList = _display ctrlCreate ["grad_vehicleSpawner_rscListNBox",IDC_INFO_LIST,_infoCtrlGroup];
_infoList ctrlSetPosition [0,0,SIDEBAR_W,INFOLIST_H];
_infoList ctrlCommit 0;

private _infoTextBox = _display ctrlCreate ["RscStructuredText",IDC_INFO_AUTHOR,_infoCtrlGroup];
_infoTextBox ctrlSetPosition [0,AUTHORINFO_Y,SIDEBAR_W,AUTHORINFO_H];
_infoTextBox ctrlCommit 0;

private _infoTextBoxDisabled = _display ctrlCreate ["RscText",IDC_INFODISABLED,_cgRight];
_infoTextBoxDisabled ctrlSetPosition [0,CONTEXTAREA_Y,SIDEBAR_W,BUTTON_H];;
_infoTextBoxDisabled ctrlSetText "no information";
_infoTextBoxDisabled ctrlSetFade 1;
_infoTextBoxDisabled ctrlCommit 0;

private _buttonAnimationSources = _display ctrlCreate ["RscButtonArsenal",IDC_BUTTONANIMATIONS,_cgRight];
_buttonAnimationSources ctrlSetPosition [1 * BUTTONCONTEXT_W,0,BUTTONCONTEXT_W,BUTTON_H];
_buttonAnimationSources ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGarage\AnimationSources_ca.paa";
_buttonAnimationSources ctrlAddEventHandler ["ButtonClick",{[_this select 0,1] call grad_vehicleSpawner_fnc_onContextTabChanged}];
_buttonAnimationSources ctrlSetTooltip "Variants";
_buttonAnimationSources ctrlCommit 0;

private _listAnimationSources = _display ctrlCreate ["grad_vehicleSpawner_rscListBoxNoHighlight",IDC_LISTANIMATION,_cgRight];
_listAnimationSources ctrlSetPosition [0,CONTEXTAREA_Y,SIDEBAR_W,CONTEXTAREA_H];
_listAnimationSources ctrlAddEventHandler ["LBSelChanged",{_this call grad_vehicleSpawner_fnc_onAnimationSelChanged}];
_listAnimationSources ctrlCommit 0;

private _listAnimationSourcesDisabled = _display ctrlCreate ["RscText",IDC_LISTANIMATIONDISABLED,_cgRight];
_listAnimationSourcesDisabled ctrlSetPosition [0,CONTEXTAREA_Y,SIDEBAR_W,BUTTON_H];
_listAnimationSourcesDisabled ctrlSetText "no animation sources";
_listAnimationSourcesDisabled ctrlSetFade 1;
_listAnimationSourcesDisabled ctrlCommit 0;

private _buttonTextures = _display ctrlCreate ["RscButtonArsenal",IDC_BUTTONTEXTURES,_cgRight];
_buttonTextures ctrlSetPosition [2 * BUTTONCONTEXT_W,0,BUTTONCONTEXT_W,BUTTON_H];
_buttonTextures ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGarage\TextureSources_ca.paa";
_buttonTextures ctrlAddEventHandler ["ButtonClick",{[_this select 0,2] call grad_vehicleSpawner_fnc_onContextTabChanged}];
_buttonTextures ctrlSetTooltip "Textures";
_buttonTextures ctrlCommit 0;

private _listTextures = _display ctrlCreate ["grad_vehicleSpawner_rscListBoxNoHighlight",IDC_LISTTEXTURES,_cgRight];
_listTextures ctrlSetPosition [0,CONTEXTAREA_Y,SIDEBAR_W,CONTEXTAREA_H];
_listTextures ctrlAddEventHandler ["LBSelChanged",{_this call grad_vehicleSpawner_fnc_onTexturesSelChanged}];
_listTextures ctrlCommit 0;

private _listTexturesDisabled = _display ctrlCreate ["RscText",IDC_LISTTEXTURESDISABLED,_cgRight];
_listTexturesDisabled ctrlSetPosition [0,CONTEXTAREA_Y,SIDEBAR_W,BUTTON_H];
_listTexturesDisabled ctrlSetText "no textures";
_listTexturesDisabled ctrlSetFade 1;
_listTexturesDisabled ctrlCommit 0;

private _buttonPylons = _display ctrlCreate ["RscButtonArsenal",IDC_BUTTONPYLONS,_cgRight];
_buttonPylons ctrlSetPosition [3 * BUTTONCONTEXT_W,0,BUTTONCONTEXT_W,BUTTON_H];
_buttonPylons ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayArsenal\cargoPut_ca.paa";
_buttonPylons ctrlAddEventHandler ["ButtonClick",{[_this select 0,3] call grad_vehicleSpawner_fnc_onContextTabChanged}];
_buttonPylons ctrlSetTooltip "Pylons";
_buttonPylons ctrlCommit 0;

private _cgListPylons = _display ctrlCreate ["RscControlsGroupNoScrollbars",IDC_LISTPYLONS,_cgRight];
_cgListPylons ctrlSetPosition [0,CONTEXTAREA_Y,SIDEBAR_W,CONTEXTAREA_H];
_cgListPylons ctrlCommit 0;

private _listPylonsDisabled = _display ctrlCreate ["RscText",IDC_LISTPYLONSDISABLED,_cgRight];
_listPylonsDisabled ctrlSetPosition [0,CONTEXTAREA_Y,SIDEBAR_W,BUTTON_H];
_listPylonsDisabled ctrlSetText "no pylons";
_listPylonsDisabled ctrlSetFade 1;
_listPylonsDisabled ctrlCommit 0;

private _selectionIndicator = _display ctrlCreate ["RscBackground",IDC_CONTEXTINDICATOR,_cgRight];
_selectionIndicator ctrlSetPosition [0 * BUTTON_W,BUTTON_H,BUTTONCONTEXT_W,INDICATOR_H];
_selectionIndicator ctrlSetBackgroundColor [0,1,0,0.5];
_selectionIndicator ctrlCommit 0;
