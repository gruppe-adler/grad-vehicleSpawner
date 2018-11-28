#include "component.hpp"

#include "..\..\dialog\defines.hpp"

disableSerialization;

params [["_display",uiNamespace getVariable ["grad_vehicleSpawner_display",displayNull]],["_veh",objNull]];

if (isNull _display) exitWith {};

private _myVehicles = missionNamespace getVariable ["grad_vehicleSpawner_myVehicles",[]];
if (count _myVehicles == 0) exitWith {};
_myVehicles = _myVehicles - [objNull];
missionNamespace setVariable ["grad_vehicleSpawner_myVehicles",_myVehicles];

private _fnc_getDisplayName = {
    params ["_class"];
    _displayName = [configFile >> "CfgVehicles" >> _class,"displayName","UNKNOWN"] call BIS_fnc_returnConfigEntry;
    _displayName
};

private _ctrlListMyVehicles = _display displayCtrl IDC_LISTMYVEHICLES;
lbClear _ctrlListMyVehicles;
{
    _ctrlListMyVehicles lbAdd ([typeOf _x] call _fnc_getDisplayName);
    false
} count _myVehicles;

if (isNull _veh) then {
    _ctrlListMyVehicles lbSetCurSel -1;
} else {

    // wait until position has synchronized
    _condition = {
        params ["","","_veh"];
        !((getPos _veh) isEqualTo [0,0,0])
    };
    _statement = {

        // wait some more to be sure
        [{
            params ["_ctrlListMyVehicles","_myVehicles","_veh"];
            if (isNull _veh) exitWith {};
            if (isNull _ctrlListMyVehicles) exitWith {};
            _ctrlListMyVehicles lbSetCurSel (_myVehicles find _veh);
        },_this,0.2] call CBA_fnc_waitAndExecute;
    };
    [_condition,_statement,[_ctrlListMyVehicles,_myVehicles,_veh],1,_statement] call CBA_fnc_waitUntilAndExecute;
};
