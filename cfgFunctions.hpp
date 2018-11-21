#ifndef MODULES_DIRECTORY
    #define MODULES_DIRECTORY modules
#endif

class grad_vehicleSpawner {

    class common {
        file = MODULES_DIRECTORY\grad-vehicleSpawner\functions\common;

        class addInteraction {};
        class compileSpawnPositions {};
        class createDroneAI {};
        class filterVehicleData {};
        class findEmptySpawnPosition {};
        class getDLC {};
        class getVehicleWeapons {};
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
        class enableSpawnButton {};
        class fillSelectionList {};
        class openDialog {};
        class setCamTarget {};
        class showMessage {};
        class updateAnimationList {};
        class updateCamera {};
        class updateInformation {};
        class updateMyVehiclesInfo {};
        class updatePylonsList {};
        class updateTexturesList {};
    };

    class events {
        file = MODULES_DIRECTORY\grad-vehicleSpawner\functions\events;

        class onAnimationSelChanged {};
        class onButtonDelete {};
        class onButtonMount {};
        class onButtonSpawn {};
        class onContextTabChanged {};
        class onDialogUnload {};
        class onKeyDown {};
        class onMouseButtonDown {};
        class onMouseButtonUp {};
        class onMouseMoving {};
        class onMouseOverSidebar {};
        class onMouseZChanged {};
        class onMyVehListSelChanged {};
        class onNewVehicleSelected {};
        class onPylonSelChanged {};
        class onSelectionChanged {};
        class onSelectionTabChanged {};
        class onTexturesSelChanged {};
    };

    class spawn {
        file = MODULES_DIRECTORY\grad-vehicleSpawner\functions\spawn;

        class deletePreview {};
        class deleteVehicle {};
        class onSpawnClient {};
        class restorePreview {};
        class spawnPreview {};
        class spawnVehicle {};
    };

};
