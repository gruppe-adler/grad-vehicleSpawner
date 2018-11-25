 #include "component.hpp"

#include "..\..\dialog\defines.hpp"

params [["_vehiclesTypes",[]],["_spawnPositions",[]],["_onDisplayOpen",GVAR(onDisplayOpen)],["_onDisplayClose",GVAR(onDisplayClose)],["_eventParams",GVAR(eventParams)],["_onSpawn",GVAR(onSpawn)]];

[] call FUNC(preload);

if (!isNull (missionNamespace getVariable [QGVAR(cam),objNull])) exitWith {};
GVAR(cam) = "camera" camcreate (getPos player);
GVAR(cam) cameraeffect ["External","back"];
if (sunOrMoon < 0.35) then {camUseNVG true; grad_vehicleSpawner_camUseNVG = true} else {grad_vehicleSpawner_camUseNVG = false};

showCinemaBorder false;
GVAR(camProperties) = [10,45,20,[0,0,-0.8]];

GVAR(spawnPositions) = [_spawnPositions] call FUNC(compileSpawnPositions);
GVAR(localVeh) = objNull;
GVAR(target) = objNull;
GVAR(selVeh) = objNull;
GVAR(rMouseDown) = false;
GVAR(mouseOverArea) = true;
GVAR(currentVehicleData) = [missionNamespace getVariable [QGVAR(data),[[],[],[],[],[]]],_vehiclesTypes] call FUNC(filterVehicleData);

disableSerialization;

private _display = (findDisplay 46) createDisplay "RscDisplayEmpty";
uiNamespace setVariable [QGVAR(display),_display];
_display displayAddEventHandler ["Unload", {_this call FUNC(onDialogUnload)}];
_display displayAddEventHandler ["KeyDown", {_this call FUNC(onKeydown)}];

_display displayaddeventhandler ["mousebuttondown",{_this call FUNC(onMouseButtonDown)}];
_display displayaddeventhandler ["mousebuttonup",{_this call FUNC(onMouseButtonUp)}];
_display displayaddeventhandler ["mousezchanged",{_this call FUNC(onMouseZChanged)}];

[player] call FUNC(setCamTarget);

private _cgLeft = _display ctrlCreate ["RscControlsGroupNoScrollbars",IDC_CGLEFT];
_cgLeft ctrlSetPosition [safeZoneX,safeZoneY,SIDEBAR_W,safezoneH];
_cgLeft ctrlSetFade SIDEBAR_FADE;
_cgLeft ctrlCommit 0;

private _cgRight = _display ctrlCreate ["RscControlsGroupNoScrollbars",IDC_CGRIGHT];
_cgRight ctrlSetPosition [safeZoneX + safeZoneW - SIDEBAR_W,safeZoneY,SIDEBAR_W,safezoneH];
_cgRight ctrlSetFade SIDEBAR_FADE;
_cgRight ctrlCommit 0;

private _ctrlMessage = _display ctrlCreate [QGVAR(rscText),IDC_MESSAGE];
_ctrlMessage ctrlSetPosition [safeZoneX + SIDEBAR_W,safeZoneY,safeZoneW - 2 * SIDEBAR_W,BUTTON_H];
_ctrlMessage ctrlSetFade 1;
_ctrlMessage ctrlCommit 0;

[_display,_cgLeft,_cgRight] call FUNC(createBackground);
[_display,_cgLeft] call FUNC(createSelectionList);
[_display,_cgRight] call FUNC(createVehicleContext);
[_display,_cgRight] call FUNC(createMyVehiclesInfo);
[_display] call FUNC(createMouseArea);

[_display,_vehiclesTypes] call FUNC(fillSelectionList);
[_display] call FUNC(updateMyVehiclesInfo);


private _defaultCategorySelection = switch (true) do {
    case ("ALL" in _vehiclesTypes || count _vehiclesTypes == 0 || "ALLWHEELED" in _vehiclesTypes): {0};
    case ("ALLTRACKED" in _vehiclesTypes): {1};
    case ("ALLHELIS" in _vehiclesTypes): {2};
    case ("ALLPLANES" in _vehiclesTypes): {3};
    case ("ALLBOATS" in _vehiclesTypes): {4};
    default {0};
};
[controlNull,_defaultCategorySelection] call FUNC(onSelectionTabChanged);
[controlNull,0] call FUNC(onContextTabChanged);

_display setVariable [QGVAR(onDisplayClose),_onDisplayClose];
_display setVariable [QGVAR(eventParams),_eventParams];
_display setVariable [QGVAR(onSpawn),_onSpawn];

[_display,_eventParams] call _onDisplayOpen;
