class grad_vehicleSpawner_rscMouseArea {
    access = 0;
    idc = -1;

    w = "safezoneW";
    h = "safezoneH";
    x = "safezoneX";
    y = "safezoneY";

    colorBackground[] = {0,0,0,0};
    colorShadow[] = {0,0,0,0.5};
    colorText[] = {1,1,1,1};
    deletable = 0;
    fade = 0;
    fixedWidth = 0;
    font = "RobotoCondensed";
    linespacing = 1;
    shadow = 1;
    SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    style = 16;
    text = "";
    tooltipColorBox[] = {1,1,1,1};
    tooltipColorShade[] = {0,0,0,0.65};
    tooltipColorText[] = {1,1,1,1};
    type = 0;
};

class grad_vehicleSpawner_rscListBox {
    access = 0;
    idc = -1;
    type = 5;
    style = 16;

    h = 0.3;
    w = 0.3;
    x = 0;
    y = 0;

    arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
    arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
    autoScrollDelay = 5;
    autoScrollRewind = 0;
    autoScrollSpeed = -1;
    colorBackground[] = {0,0,0,0};
    colorDisabled[] = {1,1,1,0.25};
    colorPicture[] = {1,1,1,1};
    colorPictureDisabled[] = {1,1,1,0.25};
    colorPictureRight[] = {1,1,1,1};
    colorPictureRightDisabled[] = {1,1,1,0.25};
    colorPictureRightSelected[] = {1,1,1,1};
    colorPictureSelected[] = {1,1,1,1};
    colorScrollbar[] = {1,0,0,0};
    colorSelect[] = {0,0,0,1};
    colorSelect2[] = {0,0,0,1};
    colorSelect2Right[] = {0,0,0,1};
    colorSelectBackground[] = {0.95,0.95,0.95,1};
    colorSelectBackground2[] = {1,1,1,0.5};
    colorSelectRight[] = {0,0,0,1};
    colorShadow[] = {0,0,0,0.5};
    colorText[] = {1,1,1,1};
    colorTextRight[] = {1,1,1,1};
    deletable = 0;
    fade = 0;
    font = "RobotoCondensed";
    maxHistoryDelay = 1;
    period = 1.2;
    rowHeight = 0;
    shadow = 0;
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};
    tooltipColorBox[] = {1,1,1,1};
    tooltipColorShade[] = {0,0,0,0.65};
    tooltipColorText[] = {1,1,1,1};

    class ListScrollBar {
        arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
        arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
        autoScrollDelay = 5;
        autoScrollEnabled = 1;
        autoScrollRewind = 0;
        autoScrollSpeed = -1;
        border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
        color[] = {1,1,1,1};
        colorActive[] = {1,1,1,1};
        colorDisabled[] = {1,1,1,0.3};
        height = 0;
        scrollSpeed = 0.06;
        shadow = 0;
        thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
        width = 0;
    };
};

class grad_vehicleSpawner_rscListBoxNoHighlight: grad_vehicleSpawner_rscListBox {
    colorSelectBackground[] = {0.95,0.95,0.95,0};
    colorSelectBackground2[] = {1,1,1,0};
    colorSelect[] = {1,1,1,1};
    colorSelect2[] = {1,1,1,1};
};

class grad_vehicleSpawner_rscListNBox {
    access = 0;
	idc = -1;
    h = 0.3;
    w = 0.3;
    x = 0;
    y = 0;
	type = CT_LISTNBOX;
	style = ST_LEFT + LB_TEXTURES;
	default = 0;
	blinkingPeriod = 0;

	colorSelectBackground[] = {1,1,1,0};
	colorSelectBackground2[] = {1,1,1,0};

	sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	font = "RobotoCondensed";
	shadow = 0;
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.5};
	colorSelect[] = {1,1,1,1};
	colorSelect2[] = {1,1,1,1};
	colorShadow[] = {0,0,0,0.5};

	tooltip = "";
	tooltipColorShade[] = {0,0,0,1};
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};

	columns[] = {0.0,0.75};

	drawSideArrows = 0;
	idcLeft = 1001;
	idcRight = 1002;
	period = 1;
	rowHeight = 0;
	maxHistoryDelay = 1;

	soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};

	class ListScrollBar
	{
		width = 0;
		height = 0;
		scrollSpeed = 0.01;

		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";

		color[] = {1,1,1,1};
	};
};

class grad_vehicleSpawner_rscCategoryButton {
    access = 0;
    idc = -1;

    w = 0.095589;
    x = 0;
    y = 0;
    h = 0.039216;

    borderSize = 0;
    colorBackground[] = {0,0,0,0.8};
    colorBackgroundActive[] = {0,0,0,1};
    colorBackgroundDisabled[] = {0,0,0,1};
    colorBorder[] = {0,0,0,1};
    colorDisabled[] = {0.2,0.2,0.2,1};
    colorFocused[] = {0,0,0,1};
    colorShadow[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    deletable = 0;
    fade = 0;
    font = "RobotoCondensed";
    offsetPressedX = 0;
    offsetPressedY = 0;
    offsetX = 0;
    offsetY = 0;
    shadow = 2;
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
    soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
    style = "0x30 + 0x800";
    text = "";
    type = 1;
    url = "";
};

class grad_vehicleSpawner_rscSpawnButton {
    access = 0;
    idc = -1;
    type = 1;
    style = 2;

    w = 0.095589;
    x = 0;
    y = 0;
    h = 0.039216;

    borderSize = 0;
    /*colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0])",1};*/
    colorBackground[] = {0.13,0.54,0.21,1};
    colorBackgroundActive[] = {0.156,0.648,0.252,1};
    colorBackgroundDisabled[] = {0,0,0,0.5};
    colorBorder[] = {0,0,0,1};
    colorDisabled[] = {1,1,1,0.25};
    colorFocused[] = {0.13,0.54,0.21,1};
    colorShadow[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    deletable = 0;
    fade = 0;
    font = "RobotoCondensed";
    offsetPressedX = 0;
    offsetPressedY = 0;
    offsetX = 0;
    offsetY = 0;
    shadow = 2;
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
    soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
    soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
    text = "";
    url = "";
};

class grad_vehicleSpawner_rscDeleteButton: grad_vehicleSpawner_rscSpawnButton {
    colorBackground[] = {0.65,0,0,1};
    colorBackgroundActive[] = {0.75,0,0,1};
    colorFocused[] = {0.65,0,0,1};
};


class grad_vehicleSpawner_rscText {
    access = 0;
    type = CT_STATIC;
    idc = -1;
    style = ST_CENTER;
    x = 0;
    y = 0;
    w = 0.1;
    h = 0.05;
    //x and y are not part of a global class since each rsctext will be positioned 'somewhere'
    font = "EtelkaMonospacePro";
    sizeEx = 0.04;
    colorBackground[] = {0,0,0,1};
    colorText[] = {1,1,1,1};
    text = "";
    fixedWidth = 0;
    shadow = 0;
};
