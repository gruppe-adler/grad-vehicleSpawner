#include "component.hpp"

params ["_data","_vehiclesTypes"];

if ("ALL" in _vehiclesTypes || count _vehiclesTypes == 0) exitWith {_data};

private _filteredData = [];
{
    _categoryData = _data select _forEachIndex;

    if (_x in _vehiclesTypes) then {
        _filteredData pushBack _categoryData;
    } else {
        _filteredData pushBack [];
    };
} forEach ["ALLWHEELED","ALLTRACKED","ALLHELIS","ALLPLANES","ALLBOATS"];


_remainingVehiclesTypes = (+_vehiclesTypes) - ["ALLWHEELED","ALLTRACKED","ALLHELIS","ALLPLANES","ALLBOATS"];
{
    _cfg = configFile >> "cfgVehicles" >> _x;
    if (isClass _cfg) then {
        _simulation = getText (_cfg >> "simulation");
        _categoryID = switch toLower _simulation do {
            case "car";
            case "carx": {0};
            case "tank";
            case "tankx": {
                if (getnumber (_cfg >> "maxspeed") > 0) then {
                    1
                } else {
                    -1
                };
            };
            case "helicopter";
            case "helicopterx";
            case "helicopterrtd": {
                2
            };
            case "airplane";
            case "airplanex": {
                3
            };
            case "ship";
            case "shipx";
            case "submarinex": {
                4
            };
            default {-1};
        };

        if (_categoryID >= 0) then {
            _model = toLower getText (_cfg >> "model");
            if (getNumber (_cfg >> "forceInGarage") > 0) then {_model = _model + ":" + configname _cfg;};
            _items = _filteredData select _categoryID;
            _modelID = _items find _model;
            if (_modelID < 0) then {
                _modelID = count _items;
                _items pushback _model;
                _items pushback [];
            };
            _modelData = _items select (_modelID + 1);
            _modelData pushback _cfg;
        };
    };

    false
} count _remainingVehiclesTypes;


_filteredData
