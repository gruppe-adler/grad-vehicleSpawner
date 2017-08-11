#include "ui_toolkit.hpp"

#define UI_GRID_W                   (pixelW * pixelGrid)
#define UI_GRID_H                   (pixelH * pixelGrid)
#define UI_GUTTER_W                 (pixelW * 2)
#define UI_GUTTER_H                 (pixelH * 2)

#define COLOR_BACKGROUND            0,0,0,0.5
#define COLOR_BUTTONSPAWN           0,1,0,0.8

#define SIDEBAR_W                   (UI_GRID_W * 30)
#define BUTTON_W                    (SIDEBAR_W / 5)
#define BUTTON_H                    (UI_GRID_H * 4)
#define BUTTONSPAWN_H               (UI_GRID_H * 6)
#define BUTTONCONTEXT_W             (SIDEBAR_W / 3)
#define INDICATOR_H                 (BUTTON_H * 0.15)
#define SELECTIONLIST_H             (safeZoneH - BUTTON_H - INDICATOR_H - 5*UI_GUTTER_H - BUTTONSPAWN_H)
#define SELECTIONLIST_Y             (BUTTON_H + INDICATOR_H + 1*UI_GUTTER_H)
#define MYVEHICLEINFO_Y             (safeZoneH/2 * 1.2)
#define CONTEXTAREA_Y               (BUTTON_H + INDICATOR_H + 1*UI_GUTTER_H)
#define CONTEXTAREA_H               (MYVEHICLEINFO_Y - CONTEXTAREA_Y)
#define AUTHORINFO_H                (UI_GRID_H * 6)
#define AUTHORINFO_Y                (CONTEXTAREA_H - AUTHORINFO_H)
#define INFOLIST_H                  (CONTEXTAREA_H - AUTHORINFO_H)
#define BACKGROUND_H                (SELECTIONLIST_Y + SELECTIONLIST_H + 2*UI_GUTTER_H)
#define MYVEHLIST_Y                 (MYVEHICLEINFO_Y + BUTTON_H + UI_GUTTER_H)
#define MYVEHLIST_H                 (safeZoneH - MYVEHLIST_Y - UI_GUTTER_H - BUTTONSPAWN_H)
#define BUTTONRIGHT_W               ((SIDEBAR_W / 2) - 1*UI_GUTTER_W)
#define BUTTONRIGHT2_X              BUTTONRIGHT_W + 1*UI_GUTTER_W

#define SIDEBAR_FADEIN              0.1
#define SIDEBAR_FADEOUT             0.3
#define SIDEBAR_FADE                0.5
#define HIDEUI_FADEIN               0.1

#define IDC_CGLEFT                  5051
#define IDC_CGRIGHT                 5052

#define IDC_SELECTIONLISTCAR        5101
#define IDC_SELECTIONLISTTRACKED    5102
#define IDC_SELECTIONLISTHELI       5103
#define IDC_SELECTIONLISTPLANE      5104
#define IDC_SELECTIONLISTBOAT       5105
#define IDC_SELECTIONBUTTONCAR      5151
#define IDC_SELECTIONBUTTONTRACKED  5152
#define IDC_SELECTIONBUTTONHELI     5153
#define IDC_SELECTIONBUTTONPLANE    5154
#define IDC_SELECTIONBUTTONBOAT     5155

#define IDC_SELECTIONINDICATOR      5199

#define IDC_INFO                    5201
#define IDC_LISTANIMATION           5202
#define IDC_LISTTEXTURES            5203
#define IDC_BUTTONANIMATIONS        5251
#define IDC_BUTTONTEXTURES          5252
#define IDC_INFODISABLED            5301
#define IDC_LISTANIMATIONDISABLED   5302
#define IDC_LISTTEXTURESDISABLED    5303
#define IDC_CONTEXTINDICATOR        5299
#define IDC_INFO_LIST               5401
#define IDC_INFO_AUTHOR             5402
#define IDC_LISTMYVEHICLES          5501
#define IDC_BUTTONSPAWN             5600
#define IDC_BUTTONMOUNT             5700
#define IDC_BUTTONDELETE            5800

#define IDCS_SELECTIONTABS          IDC_SELECTIONLISTCAR,IDC_SELECTIONLISTTRACKED,IDC_SELECTIONLISTHELI,IDC_SELECTIONLISTPLANE,IDC_SELECTIONLISTBOAT
#define IDCS_CONTEXTTABS            IDC_INFO,IDC_LISTANIMATION,IDC_LISTTEXTURES
