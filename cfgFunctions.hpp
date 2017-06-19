#ifndef MODULES_DIRECTORY
    #define MODULES_DIRECTORY modules
#endif

class grad_vehicleSpawner {
    class common {
        file = MODULES_DIRECTORY\grad-vehicleSpawner\functions\common;

        class addInteraction {};
        class initModule {postInit = 1;};
        class trackVehicleStatus {};
    };
    class dialog {
        file = MODULES_DIRECTORY\grad-vehicleSpawner\functions\dialog;

        class openDialog {};
    };
    class spawn {
        file = MODULES_DIRECTORY\grad-vehicleSpawner\functions\spawn;

        class deletePreview {};
        class onSpawnClient {};
        class requestSpawn {};
        class spawnPreview {};
        class spawnVehicle {};
    };

};
