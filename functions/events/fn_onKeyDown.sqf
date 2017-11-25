#include "component.hpp"
#include "\A3\ui_f\hpp\defineDIKCodes.inc"

#include "..\..\dialog\defines.hpp"

params ["_display","_DIK","_shift","_ctrl","_alt"];

if (_DIK in (actionKeys "nightVision")) then {
    camUseNVG !grad_vehicleSpawner_camUseNVG;
    grad_vehicleSpawner_camUseNVG = !grad_vehicleSpawner_camUseNVG;
};

private _return = switch (_DIK) do {
    case (DIK_BACKSPACE): {
        _cgLeft = _display displayCtrl IDC_CGLEFT;
        _cgRight = _display displayCtrl IDC_CGRIGHT;
        _cgLeft ctrlShow !(ctrlShown _cgLeft);
        _cgRight ctrlShow !(ctrlShown _cgRight);
        true
    };
    default {false};
};

_return
