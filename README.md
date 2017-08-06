# GRAD Vehicle Spawner

## Dependencies
* [CBA_A3](https://github.com/CBATeam/CBA_A3)

## Installation
### Manually
1. Create a folder in your mission root folder and name it `modules`. Then create one inside there and call it `grad-vehicleSpawner`.
2. Download the contents of this repository ( there's a download link at the side ) and put it into the directory you just created.
3. Append the following lines of code to the `description.ext`:

```sqf
#include "modules\grad-vehicleSpawner\vehicleSpawner.hpp"

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
Add the class `cfgGradVehicleSpawner` to your `description.ext`. Use the following attributes to configure the module:

### Attributes

Attribute   | Default Value | Explanation
------------|---------------|-------------------------------------------------------------------------------------
maxVehicles | 40            | Threshold of spawned vehicles, after which empty vehicles will be deleted instantly.

### Example

```sqf
class cfgGradVehicleSpawner {
    maxVehicles = 100;
};
```

## Implementation

`[vehicleTypes,spawnPositions] call grad_vehicleSpawner_fnc_openDialog`

Parameter | Explanation
------------|---------------
vehicleTypes | Array - Does nothing right now. Empty array to allow all existing vehicles.
spawnPositions | Array - Array of 5 Spawnpositions (one for each vehicle type)

Spawnpositions have to be in order: [Wheeled,Tracked,Rotary Wing,Fixed Wing,Naval]  
Each positions can have a fourth entry besides x,y and z: Spawn direction of the vehicle for this position.

### Example

```sqf
_spawnLand = [3200,1200,0];  // Wheeled and tracked will use same spawn position
_spawnAir = [3500,1600,0,128];  // spawndirection is 128 >> in direction of runway
_spawnWater = [3140,1400,0];

[[],[_spawnLand,_spawnLand,_spawnAir,_spawnAir,_spawnWater]] call grad_vehicleSpawner_fnc_openDialog
```
