#include "component.hpp"

params ["_display","_exitCode"];

grad_vehicleSpawner_cam cameraeffect ["terminate", "back"];
camDestroy grad_vehicleSpawner_cam;

grad_vehicleSpawner_cam = nil;
grad_vehicleSpawner_spawnPositions = nil;
grad_vehicleSpawner_rMouseDown = nil;
grad_vehicleSpawner_currentSelTabID = nil;
grad_vehicleSpawner_camProperties = nil;
grad_vehiclespawner_target = nil;
grad_vehicleSpawner_mouseOverArea = nil;
grad_vehicleSpawner_currentContextTabID = nil;
grad_vehicleSpawner_currentVehicleCfg = nil;

deleteVehicle grad_vehicleSpawner_localVeh;
grad_vehicleSpawner_localVeh = nil;
