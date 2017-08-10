#include "component.hpp"

#include "..\..\dialog\defines.hpp"

params ["_buttonCtrl"];

private _preview = missionNamespace getVariable ["grad_vehicleSpawner_localVeh",objNull];
private _vehClass = typeOf _preview;
private _textures = _preview getVariable ["grad_vehicleSpawner_textures",[]];
private _animations = _preview getVariable ["grad_vehicleSpawner_animations",[]];
private _spawnPos = grad_vehicleSpawner_spawnPositions select grad_vehicleSpawner_currentSelTabID;
[] call grad_vehicleSpawner_fnc_deletePreview;

[_vehClass,_textures,_animations,_spawnPos,playerSide] remoteExec ["grad_vehicleSpawner_fnc_spawnVehicle",2,false];

private _display = uiNamespace getVariable ["grad_vehicleSpawner_display",displayNull];
if (!isNull _display) then {
    {
        (_display displayCtrl _x) lbSetCurSel -1;
        false
    } count [IDCS_SELECTIONTABS];
};
