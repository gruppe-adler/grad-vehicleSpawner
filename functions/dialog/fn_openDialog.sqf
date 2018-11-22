 #include "component.hpp"

#include "..\..\dialog\defines.hpp"

params [["_vehiclesTypes",[]],["_spawnPositions",[]],["_onDisplayOpen",{}],["_onDisplayClose",{}],["_eventParams",[]]];

[] call grad_vehicleSpawner_fnc_preload;

if (!isNull (missionNamespace getVariable ["grad_vehicleSpawner_cam",objNull])) exitWith {};
grad_vehicleSpawner_cam = "camera" camcreate (getPos player);
grad_vehicleSpawner_cam cameraeffect ["External","back"];
if (sunOrMoon < 0.35) then {camUseNVG true; grad_vehicleSpawner_camUseNVG = true} else {grad_vehicleSpawner_camUseNVG = false};

showCinemaBorder false;
grad_vehicleSpawner_camProperties = [10,45,20,[0,0,-0.8]];

grad_vehicleSpawner_spawnPositions = [_spawnPositions] call grad_vehicleSpawner_fnc_compileSpawnPositions;
grad_vehicleSpawner_localVeh = objNull;
grad_vehicleSpawner_target = objNull;
grad_vehicleSpawner_selVeh = objNull;
grad_vehicleSpawner_rMouseDown = false;
grad_vehicleSpawner_mouseOverArea = true;
grad_vehicleSpawner_currentVehicleData = [missionNamespace getVariable ["grad_vehicleSpawner_data",[[],[],[],[],[]]],_vehiclesTypes] call grad_vehicleSpawner_fnc_filterVehicleData;

disableSerialization;

private _display = (findDisplay 46) createDisplay "RscDisplayEmpty";
uiNamespace setVariable ["grad_vehicleSpawner_display",_display];
_display displayAddEventHandler ["Unload", {_this call grad_vehicleSpawner_fnc_onDialogUnload}];
_display displayAddEventHandler ["KeyDown", {_this call grad_vehicleSpawner_fnc_onKeydown}];

_display displayaddeventhandler ["mousebuttondown",{_this call grad_vehicleSpawner_fnc_onMouseButtonDown}];
_display displayaddeventhandler ["mousebuttonup",{_this call grad_vehicleSpawner_fnc_onMouseButtonUp}];
_display displayaddeventhandler ["mousezchanged",{_this call grad_vehicleSpawner_fnc_onMouseZChanged}];

[player] call grad_vehicleSpawner_fnc_setCamTarget;

private _cgLeft = _display ctrlCreate ["RscControlsGroupNoScrollbars",IDC_CGLEFT];
_cgLeft ctrlSetPosition [safeZoneX,safeZoneY,SIDEBAR_W,safezoneH];
_cgLeft ctrlSetFade SIDEBAR_FADE;
_cgLeft ctrlCommit 0;

private _cgRight = _display ctrlCreate ["RscControlsGroupNoScrollbars",IDC_CGRIGHT];
_cgRight ctrlSetPosition [safeZoneX + safeZoneW - SIDEBAR_W,safeZoneY,SIDEBAR_W,safezoneH];
_cgRight ctrlSetFade SIDEBAR_FADE;
_cgRight ctrlCommit 0;

private _ctrlMessage = _display ctrlCreate ["grad_vehicleSpawner_rscText",IDC_MESSAGE];
_ctrlMessage ctrlSetPosition [safeZoneX + SIDEBAR_W,safeZoneY,safeZoneW - 2 * SIDEBAR_W,BUTTON_H];
_ctrlMessage ctrlSetFade 1;
_ctrlMessage ctrlCommit 0;

[_display,_cgLeft,_cgRight] call grad_vehicleSpawner_fnc_createBackground;
[_display,_cgLeft] call grad_vehicleSpawner_fnc_createSelectionList;
[_display,_cgRight] call grad_vehicleSpawner_fnc_createVehicleContext;
[_display,_cgRight] call grad_vehicleSpawner_fnc_createMyVehiclesInfo;
[_display] call grad_vehicleSpawner_fnc_createMouseArea;

[_display,_vehiclesTypes] call grad_vehicleSpawner_fnc_fillSelectionList;
[_display] call grad_vehicleSpawner_fnc_updateMyVehiclesInfo;


private _defaultCategorySelection = switch (true) do {
    case ("ALL" in _vehiclesTypes || count _vehiclesTypes == 0 || "ALLWHEELED" in _vehiclesTypes): {0};
    case ("ALLTRACKED" in _vehiclesTypes): {1};
    case ("ALLHELIS" in _vehiclesTypes): {2};
    case ("ALLPLANES" in _vehiclesTypes): {3};
    case ("ALLBOATS" in _vehiclesTypes): {4};
    default {0};
};
[controlNull,_defaultCategorySelection] call grad_vehicleSpawner_fnc_onSelectionTabChanged;
[controlNull,0] call grad_vehicleSpawner_fnc_onContextTabChanged;

_display setVariable ["grad_vehicleSpawner_onDisplayClose",_onDisplayClose];
_display setVariable ["grad_vehicleSpawner_eventParams",_eventParams];

[_display,_eventParams] call _onDisplayOpen;
