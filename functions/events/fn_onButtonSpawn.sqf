#include "component.hpp"

#include "..\..\dialog\defines.hpp"

params ["_buttonCtrl"];

private _preview = missionNamespace getVariable [QGVAR(localVeh),objNull];
private _vehClass = typeOf _preview;
private _textures = _preview getVariable [QGVAR(textures),[]];
private _animations = _preview getVariable [QGVAR(animations),[]];
private _spawnPos = GVAR(spawnPositions) select GVAR(currentSelTabID);
private _pylonMags = getPylonMagazines _preview;

[nil,true] call FUNC(deletePreview);


private _display = uiNamespace getVariable [QGVAR(display),displayNull];
private _onSpawn = _display getVariable [QGVAR(onSpawn),{}];
private _eventParams = _display getVariable [QGVAR(eventParams),[]];
[_vehClass,_textures,_animations,_spawnPos,_pylonMags,playerSide,_onSpawn,_eventParams] remoteExec [QFUNC(spawnVehicle),2,false];

if (!isNull _display) then {
    {
        (_display displayCtrl _x) lbSetCurSel -1;
        false
    } count [IDCS_SELECTIONTABS];
};
