#include "component.hpp"
#include "\A3\ui_f\hpp\defineDIKCodes.inc"

#include "..\..\dialog\defines.hpp"

params ["_display","_DIK","_shift","_ctrl","_alt"];

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
