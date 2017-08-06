#include "ui_toolkit.hpp"

#define UI_GRID_W                   (pixelW * pixelGrid)
#define UI_GRID_H                   (pixelH * pixelGrid)
#define UI_GUTTER_W                 (pixelW * 2)
#define UI_GUTTER_H                 (pixelH * 2)

#define COLOR_BACKGROUND            0,0,0,0.2
#define COLOR_BUTTONSPAWN           0,1,0,0.8

#define SIDEBAR_W                   (UI_GRID_W * 30)
#define BUTTON_W                    (SIDEBAR_W / 5)
#define BUTTON_H                    (UI_GRID_H * 4)
#define BUTTONSPAWN_H               (UI_GRID_H * 6)
#define BUTTONCONTEXT_W             (SIDEBAR_W / 3)
#define INDICATOR_H                 (BUTTON_H * 0.15)
#define SELECTIONLIST_H             (safeZoneH - BUTTON_H - INDICATOR_H - 2*UI_GUTTER_H - BUTTONSPAWN_H)
#define SELECTIONLIST_Y             (BUTTON_H + INDICATOR_H + 1*UI_GUTTER_H)
#define MYVEHICLEINFO_Y             (safeZoneH/2)
#define CONTEXTAREA_Y               (BUTTON_H + INDICATOR_H + 1*UI_GUTTER_H)
#define CONTEXTAREA_H               (safeZoneH/2 - CONTEXTAREA_Y)

#define IDC_SELECTIONLISTCAR        5101
#define IDC_SELECTIONLISTTRACKED    5102
#define IDC_SELECTIONLISTHELI       5103
#define IDC_SELECTIONLISTPLANE      5104
#define IDC_SELECTIONLISTBOAT       5105
#define IDC_SELECTIONINDICATOR      5199

#define IDC_INFO                    5201
#define IDC_LISTANIMATION           5202
#define IDC_LISTTEXTURES            5203
#define IDC_INFODISABLED            5301
#define IDC_LISTANIMATIONDISABLED   5302
#define IDC_LISTTEXTURESDISABLED    5303
#define IDC_CONTEXTINDICATOR        5299

#define IDCS_SELECTIONTABS          IDC_SELECTIONLISTCAR,IDC_SELECTIONLISTTRACKED,IDC_SELECTIONLISTHELI,IDC_SELECTIONLISTPLANE,IDC_SELECTIONLISTBOAT
#define IDCS_CONTEXTTABS            IDC_INFO,IDC_LISTANIMATION,IDC_LISTTEXTURES
