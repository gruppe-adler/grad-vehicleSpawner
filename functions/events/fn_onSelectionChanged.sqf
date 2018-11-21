#include "component.hpp"
#include "..\..\dialog\defines.hpp"

params ["_listCtrl","_selID","_tabID",["_restoredPreview",objNull]];

if (_selID < 0) exitWith {};

private _data = missionNamespace getVariable [QGVAR(currentVehicleData),[[],[],[],[],[]]];

private _modelIndex = _listCtrl lbValue _selID;
private _modelData = (_data select _tabID) select (_modelIndex + 1);
private _cfg = _modelData select 0;
private _class = configname _cfg;

GVAR(currentVehicleCfg) = _cfg;
private _preview = [_tabID,_cfg,_class] call FUNC(spawnPreview);

[_preview] call FUNC(onNewVehicleSelected);
