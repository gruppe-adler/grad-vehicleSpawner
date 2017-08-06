#include "component.hpp"

#include "..\..\dialog\defines.hpp"

params [["_vehiclesTypes",[]],["_spawnPositions",[]]];

[] call grad_vehicleSpawner_fnc_preload;

if (!isNull (missionNamespace getVariable ["grad_vehicleSpawner_cam",objNull])) exitWith {};
grad_vehicleSpawner_cam = "camera" camcreate (getPos player);
grad_vehicleSpawner_cam cameraeffect ["External","back"];
showCinemaBorder false;
grad_vehicleSpawner_camProperties = [10,45,20,[0,0,-0.8]];

grad_vehicleSpawner_spawnPositions = _spawnPositions;
grad_vehicleSpawner_localVeh = objNull;
grad_vehiclespawner_target = objNull;
grad_vehicleSpawner_rMouseDown = false;
grad_vehicleSpawner_mouseOverArea = true;

disableSerialization;

private _display = (findDisplay 46) createDisplay "RscDisplayEmpty";
uiNamespace setVariable ["grad_vehicleSpawner_display",_display];
_display displayAddEventHandler ["Unload", {_this call grad_vehicleSpawner_fnc_onDialogUnload}];

_display displayaddeventhandler ["mousebuttondown",{_this call grad_vehicleSpawner_fnc_onMouseButtonDown}];
_display displayaddeventhandler ["mousebuttonup",{_this call grad_vehicleSpawner_fnc_onMouseButtonUp}];
_display displayaddeventhandler ["mousezchanged",{_this call grad_vehicleSpawner_fnc_onMouseZChanged}];


private _cgLeft = _display ctrlCreate ["RscControlsGroupNoScrollbars",-1];
_cgLeft ctrlSetPosition [safeZoneX,safeZoneY,SIDEBAR_W,safezoneH];
_cgLeft ctrlCommit 0;

private _cgRight = _display ctrlCreate ["RscControlsGroupNoScrollbars",-1];
_cgRight ctrlSetPosition [safeZoneX + safeZoneW - SIDEBAR_W,safeZoneY,SIDEBAR_W,safezoneH];
_cgRight ctrlCommit 0;

[_display,_cgLeft,_cgRight] call grad_vehicleSpawner_fnc_createBackground;
[_display,_cgLeft] call grad_vehicleSpawner_fnc_createSelectionList;
[_display,_cgRight] call grad_vehicleSpawner_fnc_createVehicleContext;
[_display,_cgRight] call grad_vehicleSpawner_fnc_createMyVehiclesInfo;
[_display] call grad_vehicleSpawner_fnc_createMouseArea;

[_display] call grad_vehicleSpawner_fnc_fillSelectionList;

[controlNull,0] call grad_vehicleSpawner_fnc_onSelectionTabChanged;
[controlNull,0] call grad_vehicleSpawner_fnc_onContextTabChanged;
