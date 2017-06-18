# GRAD Vehicle Spawner

## Dependencies
* [CBA_A3](https://github.com/CBATeam/CBA_A3)

## Installation
### Manually
1. Create a folder in your mission root folder and name it `modules`. Then create one inside there and call it `grad-vehicleSpawner`.
2. Download the contents of this repository ( there's a download link at the side ) and put it into the directory you just created.
3. see step 3 below in the npm part

### Via `npm`
_for details about what npm is and how to use it, look it up on [npmjs.com](https://www.npmjs.com/)_

1. Install package `grad-vehicleSpawner` : `npm install --save grad-vehicleSpawner`
2. Prepend your mission's `description.ext` with `#define MODULES_DIRECTORY node_modules`
3. Append the following lines of code to the `description.ext`:

```sqf
#include "node_modules\grad-vehicleSpawner\grad_vehicleSpawner.hpp"

class CfgFunctions {
    #include "node_modules\grad-vehicleSpawner\cfgFunctions.hpp"
};
```
