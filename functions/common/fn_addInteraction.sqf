#include "component.hpp"

params ["_obj",["_actionName","Vehicle Spawner"],["_condition",{true}],["_vehiclesTypes",[]],["_spawnPositions",[]],["_cameraPositions",[]]];

["grad_vehicleSpawner_mainAction",_actionName,"",{
    params ["_targetObj","_caller","_actionParams"];
    _actionParams call grad_vehicleSpawner_fnc_openDialog;
},_condition,{},[_vehiclesTypes,_spawnPositions,_cameraPositions]] call ace_interact_menu_fnc_createAction;
