#include "component.hpp"
#include "..\..\dialog\defines.hpp"


params [["_preview",missionNamespace getVariable [QGVAR(localVeh),objNull]],["_savePrevious",false]];

private _previousPreview = missionNamespace getVariable [QGVAR(previousPreview),objNull];
deleteVehicle _previousPreview;

// cache preview in case spawn on server fails
if (!isNull _preview) then {
    if (_savePrevious) then {
        _preview setVariable [QGVAR(previousPosASL),getPosASL _preview];
        _preview setPosASL [0,0,0];
        GVAR(previousPreview) = _preview;
    } else {
        deleteVehicle _preview;
    };
};

[false] call FUNC(enableSpawnButton);
