#include "component.hpp"

params [["_drone",objNull],["_side",WEST]];

private _aiClass = switch (_side) do {
    case (WEST): {"B_UAV_AI"};
    case (EAST): {"O_UAV_AI"};
    case (INDEPENDENT): {"I_UAV_AI"};
    default {"B_UAV_AI"};
};

private _ai = (createGroup [_side,true]) createUnit [_aiClass, [0,0,0], [], 0, "NONE"];
_ai moveInAny _drone;
