#include "component.hpp"

#include "..\..\dialog\defines.hpp"

private _selVeh = missionNamespace getVariable ["grad_vehicleSpawner_selVeh",objNull];
private _class = typeOf _selVeh;
private _cfg = if (isNull _selVeh) then {configNull} else {configFile >> "cfgVehicles" >> _class};

private _display = uiNamespace getVariable ["grad_vehicleSpawner_display",displayNull];
private _ctrlInfoList = _display displayCtrl IDC_INFO_LIST;
private _ctrlInfoAuthor = _display displayCtrl IDC_INFO_AUTHOR;
private _ctrlInfoDisabled = _display displayCtrl IDC_INFODISABLED;

if (isNull _cfg) exitWith {
    lnbClear _ctrlInfoList;
    _ctrlInfoAuthor ctrlSetStructuredText parseText "";
};

private _displayName = [_cfg,"displayName","UNKNOWN VEHICLE"] call BIS_fnc_returnConfigEntry;
private _fuelCap = [_cfg,"fuelCapacity",0] call BIS_fnc_returnConfigEntry;
if (_fuelCap isEqualType "") then {_fuelCap = call compile _fuelCap};
private _fuelCons = [_cfg,"fuelConsumptionRate",0] call BIS_fnc_returnConfigEntry;
if (_fuelCons isEqualType "") then {_fuelCons = call compile _fuelCons};
private _maxSpeed = [_cfg,"maxSpeed",0] call BIS_fnc_returnConfigEntry;
private _slingLoadMass = [_cfg,"slingLoadMaxCargoMass",0] call BIS_fnc_returnConfigEntry;
private _crew = [_class,false] call BIS_fnc_crewCount;
private _cargo = ([_class,true] call BIS_fnc_crewCount) - _crew;
private _armor = [_cfg,"armor",0] call BIS_fnc_returnConfigEntry;

private _infoList = [
    [toUpper _displayName,""],
    ["",""],
    ["Crew",str _crew],
    ["Cargo",str _cargo],
    ["",""],
    ["Max. Speed",str _maxSpeed],
    ["Fuel Capacity",str _fuelCap],
    ["Fuel Consumption",str _fuelCons],
    ["Armor",str _armor],
    ["",""]
];

if (_slingLoadMass > 0) then {
    _infoList pushBack ["Slingload Mass",str _slingLoadMass];
    _infoList pushBack ["",""];
} else {
    _infoList pushBack ["",""];
    _infoList pushBack ["",""];
};

private _vehicleWeapons = [_class] call grad_vehicleSpawner_fnc_getVehicleWeapons;
if (count _vehicleWeapons > 0) then {
    _infoList pushBack ["Weapons:",""];
    {
        _infoList pushBack ["• " + _x,""];
        false
    } count _vehicleWeapons;
};

lnbClear _ctrlInfoList;
{_ctrlInfoList lnbAddRow _x; false} count _infoList;

_ctrlInfoDisabled ctrlshow (lbsize _ctrlInfoList == 0);

//update addon info ============================================================
private _dlc = [_cfg] call grad_vehicleSpawner_fnc_getDLC;
private _dlcParams = if (_dlc == "") then {_dlc = "BIS"; []} else {modParams [_dlc,["name","logo","logoOver"]]};
_dlcParams params [["_name","Bohemia Interactive"],["_logo","\A3\Ui_f\data\gui\cfg\unitinsignia\bi_ca.paa"],["_logoOver","\A3\Ui_f\data\logos\arma3_ingame_ca.paa"]];

_ctrlInfoAuthor ctrlSetStructuredText composeText [
    parseText format ["<img image='%1'/> %2<br/>",_logo,_dlc],
    parseText format ["<t size='0.7' color='#bbbbbb'>%1</t>",_name]
];
