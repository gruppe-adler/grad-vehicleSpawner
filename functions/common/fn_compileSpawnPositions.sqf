#include "component.hpp"

params ["_spawnPositions"];

private _return = [];
{
    _pos = switch (typeName _x) do {
        case ("ARRAY"): {
            _x
        };
        case ("CODE"): {
            _x
        };
        case ("STRING"): {
            (getMarkerPos _x) + [markerDir _x,20,5]
        };
        case ("OBJECT"): {
            (getPos _x) + [getDir _x,20,5]
        };
        default {
            [0,0,0,0,20,5]
        };
    };
    _return pushBack _pos;

    false
} count _spawnPositions;

while {count _return < 5} do {
    _return pushBack [0,0,0,0,20,5]
};

_return
