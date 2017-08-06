#include "component.hpp"

if (missionNamespace getVariable ["grad_vehicleSpawner_preloaded",false]) exitWith {};
missionNamespace setVariable ["grad_vehicleSpawner_preloaded",true];

["grad_vehicleSpawner_fnc_preload"] call bis_fnc_startloadingscreen;

private _data = [[],[],[],[],[]];
private _defaultCrew = gettext (configfile >> "cfgvehicles" >> "all" >> "crew");

{
    _simulation = gettext (_x >> "simulation");
    _items = switch tolower _simulation do {
        case "car";
        case "carx": {
            _data select 0;
        };
        case "tank";
        case "tankx": {
            if (getnumber (_x >> "maxspeed") > 0) then {
                _data select 1;
            } else {
                []
            };
        };
        case "helicopter";
        case "helicopterx";
        case "helicopterrtd": {
            _data select 2;
        };
        case "airplane";
        case "airplanex": {
            _data select 3;
        };
        case "ship";
        case "shipx";
        case "submarinex": {
            _data select 4;
        };
        default {[]};
    };

    //--- Sort vehicles by model (vehicles with the same model are displayed as one, with variable textures / animations)
    _model = tolower gettext (_x >> "model");
    if (getnumber (_x >> "forceInGarage") > 0) then {_model = _model + ":" + configname _x;}; //--- Force specific class
    _modelID = _items find _model;
    if (_modelID < 0) then {
        _modelID = count _items;
        _items pushback _model;
        _items pushback [];
    };
    _modelData = _items select (_modelID + 1);
    _modelData pushback _x;

    false
} count ("isclass _x && {getnumber (_x >> 'scope') == 2} && {gettext (_x >> 'crew') != _defaultCrew}" configclasses (configfile >> "cfgvehicles"));

missionnamespace setvariable ["grad_vehicleSpawner_data",_data];
["grad_vehicleSpawner_fnc_preload"] call bis_fnc_endloadingscreen;
