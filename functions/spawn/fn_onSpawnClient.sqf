#include "component.hpp"

params [["_veh",objNull],["_moveInDriver",false]];

if (isNull _veh) exitWith {};

if (_moveInDriver) then {player moveInDriver _veh};
