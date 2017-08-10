#include "component.hpp"
#define TRACK_INTERVAL  30


params [["_veh",objNull]];

if (isNull _veh) exitWith {ERROR("Vehicle is null.")};

grad_vehicleSpawner_activeVehicleCount = grad_vehicleSpawner_activeVehicleCount + 1;

// wait one interval before first execution, so that new vehicles don't instantly get deleted if they cross maxVehicles threshold
[{
    [{
        params ["_veh","_handle"];

        if (isNull _veh) exitWith {
            grad_vehicleSpawner_activeVehicleCount = grad_vehicleSpawner_activeVehicleCount - 1;
            [_handle] call CBA_fnc_removePerFrameHandler;
        };

        if ({isPlayer _x} count crew _veh > 0) exitWith {
            _veh setVariable ["grad_vehicleSpawner_abandonedTimer",0];
        };

        if (grad_vehicleSpawner_activeVehicleCount > grad_vehicleSpawner_maxVehicles) exitWith {
            grad_vehicleSpawner_activeVehicleCount = grad_vehicleSpawner_activeVehicleCount - 1;
            [_veh] call grad_vehicleSpawner_fnc_deleteVehicle;
            [_handle] call CBA_fnc_removePerFrameHandler;
        };

        _abandonedTimer = (_veh getVariable ["grad_vehicleSpawner_abandonedTimer",0]) + TRACK_INTERVAL;
        _veh setVariable ["grad_vehicleSpawner_abandonedTimer",_abandonedTimer];
        _immobileFactor = if (!(canMove _veh) || fuel _veh == 0) then {3} else {1};

        if (_abandonedTimer * _immobileFactor > grad_vehicleSpawner_vehicleAbandonedTime) exitWith {
            grad_vehicleSpawner_activeVehicleCount = grad_vehicleSpawner_activeVehicleCount - 1;
            [_veh] call grad_vehicleSpawner_fnc_deleteVehicle;
            [_handle] call CBA_fnc_removePerFrameHandler;
        };

    },TRACK_INTERVAL,_this] call CBA_fnc_addPerFrameHandler;
},_veh,TRACK_INTERVAL] call CBA_fnc_waitAndExecute;
