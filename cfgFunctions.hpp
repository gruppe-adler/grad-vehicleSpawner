#ifndef MODULES_DIRECTORY
    #define MODULES_DIRECTORY modules
#endif

class grad_vehicleSpawner {

    class common {
        file = MODULES_DIRECTORY\grad-vehicleSpawner\functions\common;

        class addInteraction {};
        class initModule {postInit = 1;};
        class preload {};
        class trackVehicleStatus {};
    };

    class dialog {
        file = MODULES_DIRECTORY\grad-vehicleSpawner\functions\dialog;

        class createBackground {};
        class createMouseArea {};
        class createMyVehiclesInfo {};
        class createSelectionList {};
        class createVehicleContext {};
        class fillSelectionList {};
        class openDialog {};
        class updateAnimationList {};
        class updateCamera {};
        class updateTexturesList {};
    };

    class events {
        file = MODULES_DIRECTORY\grad-vehicleSpawner\functions\events;

        class onAnimationSelChanged {};
        class onButtonSpawn {};
        class onContextTabChanged {};
        class onDialogUnload {};
        class onMouseButtonDown {};
        class onMouseButtonUp {};
        class onMouseMoving {};
        class onMouseZChanged {};
        class onSelectionChanged {};
        class onSelectionTabChanged {};
        class onTexturesSelChanged {};
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
