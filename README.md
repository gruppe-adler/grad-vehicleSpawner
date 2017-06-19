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
