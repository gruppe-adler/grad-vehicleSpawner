#include "component.hpp"

params [["_display",displayNull]];

if (isNull _display) exitWith {ERROR("Could not delete preview. Display is null.")};

deleteVehicle (_display getVariable ["grad_vehicleSpawner_currentPreview",objNull]);
