#include "component.hpp"

#include "..\..\dialog\defines.hpp"

params [["_preview",missionNamespace getVariable ["grad_vehicleSpawner_localVeh",objNull]]];

if (isNull _preview) exitWith {};
deleteVehicle _preview;

private _display = uiNamespace getVariable ["grad_vehicleSpawner_display",displayNull];
if (isNull _display) exitWith {};

private _spawnButton = _display displayCtrl IDC_BUTTONSPAWN;
_spawnButton ctrlEnable false;
