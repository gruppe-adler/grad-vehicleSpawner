#include "component.hpp"
#include "..\..\dialog\defines.hpp"

params [["_enable",true]];

private _display = uiNamespace getVariable [QGVAR(display),displayNull];
if (!isNull _display) then {
    private _spawnButton = _display displayCtrl IDC_BUTTONSPAWN;
    _spawnButton ctrlEnable _enable;
};
