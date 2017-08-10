#include "component.hpp"

params ["_spawnPositions"];

private _return = [];
{
    _pos = switch (typeName _x) do {
        case ("ARRAY"): {
            _x params [["_x",0],["_y",0],["_z",0],["_dir",0]];
            [_x,_y,_z,_dir]
        };
        case ("STRING"): {
            (getMarkerPos _x) + [markerDir _x]
        };
        case ("OBJECT"): {
            (getPos _x) + [getDir _x]
        };
        default {
            [0,0,0,0]
        };
    };
    _return pushBack _pos;

    false
} count _spawnPositions;

while {count _return < 5} do {
    _return pushBack [0,0,0,0]
};

_return
