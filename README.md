# GRAD Vehicle Spawner

## Dependencies
* [CBA_A3](https://github.com/CBATeam/CBA_A3)

## Installation
### Manually
1. Create a folder in your mission root folder and name it `modules`. Then create one inside there and call it `grad-vehicleSpawner`.
2. Download the contents of this repository ( there's a download link at the side ) and put it into the directory you just created.
3. Append the following lines of code to the `description.ext`:

```sqf
#include "modules\grad-vehicleSpawner\grad_vehicleSpawner.hpp"

class CfgFunctions {
    #include "modules\grad-vehicleSpawner\cfgFunctions.hpp"
};
```

### Via `npm`
_for details about what npm is and how to use it, look it up on [npmjs.com](https://www.npmjs.com/)_

1. Install package `grad-vehicleSpawner` : `npm install --save grad-vehicleSpawner`
2. Append the following lines of code to the `description.ext`:

```sqf
#define MODULES_DIRECTORY node_modules
#include "node_modules\grad-vehicleSpawner\grad_vehicleSpawner.hpp"

class CfgFunctions {
    #include "node_modules\grad-vehicleSpawner\cfgFunctions.hpp"
};
```

## Config
Add the class `cfgGradVehicleSpawner` to your `description.ext`. This is entirely optional. Default values will be used unless set by config. Use the following attributes to configure the module:

### Attributes

Attribute       | Default Value | Explanation
----------------|---------------|-----------------------------------------------------------------------------------------------------------
abandonedTime   | 1200          | Number - Time in seconds after which a vehicle will count as abandoned and will be deleted. (30s accuracy)
maxVehicles     | 40            | Number - Global threshold of spawned vehicles, after which empty vehicles will be deleted instantly.
maxVehiclesUser | 5             | Number - Threshold of total vehicles per user, after which his oldest vehicles will be deleted instantly.
eventParams     | []            | Array - Parameters that will be passed to events below.
onDisplayOpen   | ""            | Statement - Will be executed locally where dialog is openend. Passed parameters are [display,eventParams]
onDisplayClose  | ""            | Statement - Will be executed locally where dialog is closed. Passed parameters are [display,eventParams]
onSpawn         | ""            | Statement - Will be executed on server when vehicle is spawned. Passed parameters are [vehicle,textures,animations,netID of spawning player (remoteExecutedOwner),eventParams]

### Example

```sqf
class cfgGradVehicleSpawner {
    abandonedTime = 1500;
    maxVehicles = 100;
    maxVehiclesUser = 10;
    eventParams[] = {};
    onDisplayOpen = "systemChat 'hi!'";
    onDisplayClose = "systemChat 'bye bye!'";
    onSpawn = "(_this select 0) disableTIEquipment true";
};
```

## Implementation
Add an ACE-Interaction to an object to open the vehicle spawner dialog.

`[object,actionName,condition,vehicleTypes,spawnPositions,onDisplayOpen,onDisplayClose,eventParams,onSpawn] call grad_vehicleSpawner_fnc_addInteraction`

Parameter      | Explanation
---------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
object         | Object - The object to add the interaction to
actionName     | String - The name of the action
condition      | Code - Condition for the action to be visible. Passed parameters are [target, caller].
vehicleTypes   | Array - Sets which vehicles can be chosen from. "ALL" or empty array for all vehicles. "ALLWHEELED","ALLTRACKED","ALLHELIS","ALLPLANES","ALLBOATS" for all vehicles of the respective category. Classnames for only specific vehicles (all version that share the same model will be available).
spawnPositions | Array - Array of 5 Spawnpositions (one for each vehicle type)
onDisplayOpen  | Code - See config attribues. Overrides config value.
onDisplayClose | Code - See config attribues. Overrides config value.
onSpawn        | Code - See config attribues. Overrides config value.
eventParams    | Any - See config attribues. Overrides config value.

### Spawnpositions Array

Spawnpositions have to be in order: [Wheeled,Tracked,Rotary Wing,Fixed Wing,Naval]  
Allowed data types are:

* String - markername - direction of marker determines spawn direction
* Object - vehicles will spawn on or around given object - object direction determines spawn direction
* Array - format Pos2D, Pos3D, [x,y,z,direction,searchRadius,increment] or array of multiple position in that format (will be prioritized in the same order as given)
    * x,y - x and y coordinates
    * z (optional) - z above terrain (default: 0)
    * direction (optional) - direction in which vehicles will spawn here, 0 is most reliable (default: 0)
    * searchRadius (optional) - radius around this position which will be searched for available empty spawn positions (make this small to force exact position; default: 20)
    * increment (optional) - the smaller this is, the slower the function, but the more likely the vehicle will spawn close to center (default: 5)
* Code - Has to return [Pos3d,Direction]. Position [0,0,0] will mean no valid position was found. Params passed are [class of vehicle].
    * if you want to use `list _trigger` to check for any objects which might block a spawn, make sure to filter `objNull` as well as `grad_vehicleSpawner_target` and `grad_vehicleSpawner_localVeh`, which are a helper object and the local vehicle preview

### Example

```sqf
_spawnLand = [3200,1200,0];
_spawnTracked = [[2500,1200,0,0,5,1],[2600,1200,0,0,5,1]];  // tracked vehicles will spawn max 5m from the first position - if first position is full, second position will be used
_spawnAir = [3500,1600,0,128];  // spawndirection is 128 >> in direction of my imaginary runway

[
    _laptop,
    "GRAD Vehicle Spawner",
    {true},
    [],
    [_spawnLand,_spawnLand,helipad_1,_spawnAir,"spawnmarker_water_1"],
    {diag_log ["Vehiclespawner opened. Display:",_this select 0]},
    {diag_log format ["Vehiclespawner closed. Was open for %1s seconds.",CBA_missionTime - (_this select 1 select 0)]},
    [CBA_missionTime],
    {(_this select 0) disableTIEquipment true}
] call grad_vehicleSpawner_fnc_addInteraction;
```

## Usage

* select a vehicle from the left sidebar to preview it (local to your client)
* see preview information on the information tab on the right sidebar
* select vehicle components and textures from the variants and textures tabs on the right sidebar
* spawn a vehicle with the spawn button below the left sidebar (this will spawn the vehicle on the server)
* manage your spawned vehicles in the *my vehicles* section on the right sidebar

* drag the camera by holding RMB and moving your mouse
* zoom in and out with mouse wheel
* hide the UI with backspace
* close the spawner with escape
