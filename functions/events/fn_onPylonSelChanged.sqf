#include "component.hpp"

params ["_ctrlCombo","_curSelID"];

private _selVeh = missionNamespace getVariable ["grad_vehicleSpawner_selVeh",objNull];
if (isNull _selVeh) exitWith {};

private _cfgPylons = configFile >> "cfgVehicles" >> typeOf _selVeh >> "Components" >> "TransportPylonsComponent";
private _pylonNames = ("true" configClasses (_cfgPylons >> "Pylons")) apply {configName _x};
reverse _pylonNames;

private _pylonID = _ctrlCombo lbValue 0;
private _selMag = _ctrlCombo lbData _curSelID;
_selVeh setPylonLoadOut [_pylonNames select _pylonID,_selMag,true,[]];
