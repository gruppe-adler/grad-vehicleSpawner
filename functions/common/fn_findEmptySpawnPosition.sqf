#include "component.hpp"

params ["_searchPos",["_class","B_Soldier_F"],["_maxDist",10],["_increment",10]];

private _emptyPos = [];
for [{_i=0}, {_i<50}, {_i=_i+1}] do {
    _emptyPos = _searchPos findEmptyPosition [0,_maxDist,_class];
    if (count _emptyPos > 0) exitWith {};
    _maxDist = _maxDist + _increment;
};
if (count _emptyPos == 0) then {_emptyPos = _searchPos};

_emptyPos
