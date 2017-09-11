#include "component.hpp"

params ["_display","_exitCode"];

grad_vehicleSpawner_cam cameraeffect ["terminate", "back"];
camDestroy grad_vehicleSpawner_cam;

[_display,_display getVariable ["grad_vehicleSpawner_eventParams",[]]] call (_display getVariable ["grad_vehicleSpawner_onDisplayClose",{}]);

grad_vehicleSpawner_cam = nil;
grad_vehicleSpawner_spawnPositions = nil;
grad_vehicleSpawner_rMouseDown = nil;
grad_vehicleSpawner_currentSelTabID = nil;
grad_vehicleSpawner_camProperties = nil;
grad_vehiclespawner_target = nil;
grad_vehicleSpawner_mouseOverArea = nil;
grad_vehicleSpawner_currentContextTabID = nil;
grad_vehicleSpawner_currentVehicleCfg = nil;
grad_vehicleSpawner_sizeOld = nil;
grad_vehicleSpawner_selVeh = nil;
grad_vehicleSpawner_currentVehicleData = nil;

deleteVehicle grad_vehicleSpawner_localVeh;
grad_vehicleSpawner_localVeh = nil;
