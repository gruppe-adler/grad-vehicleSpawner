#include "component.hpp"

params ["_searchPos",["_class","B_Soldier_F"]];

if (_searchPos isEqualType {}) exitWith {
    [_class] call _searchPos
};


// if single spawnpos --> make an array
if !((_searchPos param [0,0]) isEqualType []) then {
    _searchPos = [_searchPos];
};


private _emptyPos = [0,0,0];
private _dir = 0;
{
    _x params ["_xCoord","_yCoord",["_zCoord",0],["_posDir",0],["_searchRadius",20],["_increment",5]];
    _increment = _increment max 0.1;

    _searchDist = 0.5;
    for [{_i=0},{_i<9999999},{_i=_i+1}] do {
        _emptyPos = [_xCoord,_yCoord,_zCoord] findEmptyPosition [0,_searchDist,_class];
        if (count _emptyPos > 0) exitWith {};
        _searchDist = _searchDist + _increment;
        if (_searchDist > _searchRadius) exitWith {};
    };

    if (count _emptyPos > 0) exitWith {_dir = _posDir};
} forEach _searchPos;

_return = if (count _emptyPos == 0) then {[[0,0,0],_dir]} else {[_emptyPos,_dir]};

_return
