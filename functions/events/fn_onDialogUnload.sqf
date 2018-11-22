#include "component.hpp"

params ["_display","_exitCode"];

GVAR(cam) cameraeffect ["terminate", "back"];
camDestroy GVAR(cam);

[_display,_display getVariable [QGVAR(eventParams),[]]] call (_display getVariable [QGVAR(onDisplayClose),{}]);

GVAR(cam) = nil;
GVAR(spawnPositions) = nil;
GVAR(rMouseDown) = nil;
GVAR(currentSelTabID) = nil;
GVAR(camProperties) = nil;
GVAR(mouseOverArea) = nil;
GVAR(currentContextTabID) = nil;
GVAR(currentVehicleCfg) = nil;
GVAR(sizeOld) = nil;
GVAR(selVeh) = nil;
GVAR(currentVehicleData) = nil;
grad_vehicleSpawner_camUseNVG = nil;
GVAR(pylonsComboBoxes) = nil;
GVAR(previousPreview) = nil;

deleteVehicle GVAR(target);
GVAR(target) = nil;

deleteVehicle GVAR(localVeh);
GVAR(localVeh) = nil;
