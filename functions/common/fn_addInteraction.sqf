#include "component.hpp"

params ["_obj",["_actionName","Vehicle Spawner"],["_condition",{true}],["_vehiclesTypes",[]],["_spawnPositions",[]],["_onDisplayOpen",{}],["_onDisplayClose",{}],["_eventParams",[]]];

private _action = ["grad_vehicleSpawner_mainAction",_actionName,"",{
    params ["_targetObj","_caller","_actionParams"];
    _actionParams spawn grad_vehicleSpawner_fnc_openDialog;
},_condition,{},[_vehiclesTypes,_spawnPositions,_onDisplayOpen,_onDisplayClose,_eventParams]] call ace_interact_menu_fnc_createAction;

private _isSelfInteraction = player == _obj;
[_obj,[0,1] select _isSelfInteraction,[["ACE_MainActions"],["ACE_SelfActions"]] select _isSelfInteraction,_action] call ace_interact_menu_fnc_addActionToObject;
