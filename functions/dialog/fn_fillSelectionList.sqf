#include "component.hpp"

#include "..\..\dialog\defines.hpp"

params ["_display","_vehiclesTypes"];

private _data = missionNamespace getVariable ["grad_vehicleSpawner_currentVehicleData",[[],[],[],[],[]]];

{
    _items = _x;
    _ctrlList = _display displayctrl (IDC_SELECTIONLISTCAR + _forEachIndex);

    if (count _items == 0) then {
        _ctrlButton = _display displayCtrl (IDC_SELECTIONBUTTONCAR + _forEachIndex);
        _ctrlButton ctrlEnable false;
    };

    for "_i" from 0 to (count _items - 1) step 2 do {
        _model = _items select _i;
        _modelData = _items select (_i + 1);
        _modelExample = _modelData select 0;
        _displayName = gettext (_modelExample >> "displayName");
        _lbAdd = _ctrlList lbadd _displayName;
        _ctrlList lbsetpicture [_lbAdd,gettext (_modelExample >> "picture")];
        _ctrlList lbsetdata [_lbAdd,_model];
        _ctrlList lbsetvalue [_lbAdd,_i];
        _ctrlList lbsettooltip [_lbAdd,_displayName];
        _addons = configsourceaddonlist _modelExample;
        if (count _addons > 0) then {
            _dlcs = configsourcemodlist (configfile >> "CfgPatches" >> _addons select 0);
            if (count _dlcs > 0) then {
                _ctrlList lbsetpictureright [_lbAdd,gettext (configfile >> "cfgMods" >> (_dlcs select 0) >> "logo")];
            };
        };
    };
    lbsort _ctrlList;
} foreach _data;
