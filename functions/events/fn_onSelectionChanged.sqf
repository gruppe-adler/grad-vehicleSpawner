#include "component.hpp"

#include "..\..\dialog\defines.hpp"

params ["_listCtrl","_selID","_tabID"];

if (_selID < 0) exitWith {};

private _data = missionNamespace getVariable ["grad_vehicleSpawner_currentVehicleData",[[],[],[],[],[]]];

private _modelIndex = _listCtrl lbValue _selID;
private _modelData = (_data select _tabID) select (_modelIndex + 1);
private _cfg = _modelData select 0;
private _class = configname _cfg;

grad_vehicleSpawner_currentVehicleCfg = _cfg;
private _preview = [_tabID,_cfg,_class] call grad_vehicleSpawner_fnc_spawnPreview;
grad_vehicleSpawner_selVeh = _preview;

[] call grad_vehicleSpawner_fnc_updateInformation;
[] call grad_vehicleSpawner_fnc_updateAnimationList;
[] call grad_vehicleSpawner_fnc_updateTexturesList;
[controlNull,missionNamespace getVariable ["grad_vehicleSpawner_currentContextTabID",-1]] call grad_vehicleSpawner_fnc_onContextTabChanged;

private _display = uiNamespace getVariable ["grad_vehicleSpawner_display",displayNull];
private _ctrlMyVehList = _display displayCtrl IDC_LISTMYVEHICLES;
_ctrlMyVehList lbSetCurSel -1;
