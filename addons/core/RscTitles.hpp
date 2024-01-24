class RscText;
class RscPicture;
class RscTitles {
	class GVAR(counter) {
		idd = 4948;
		enableSimulation = 1;
        movingEnable = 0;
        fadeIn=0;
        fadeOut=1;
        duration = 10e10;
		onLoad = "uiNamespace setVariable ['KJW_Radiate_Counter', _this select 0];";
		class controls {
			class CounterImage : RscPicture {
				idc = 4949;
				text = QPATHTOF(data\tx\geigercounter_ca.paa);
				x = QUOTE(0.118437 * safezoneW + safezoneX);
                y = QUOTE(0.471 * safezoneH + safezoneY);
                w = QUOTE(0.20625 * safezoneW);
                h = QUOTE(0.51 * safezoneH);
			};
			class CounterText: RscText {
                idc = 1244;
                text = "00000";
                x = QUOTE(0.160937 * safezoneW + safezoneX);
                y = QUOTE(0.560 * safezoneH + safezoneY);
                w = QUOTE(0.125 * safezoneW);
                h = QUOTE(0.063 * safezoneH);
				sizeEx = QUOTE(0.078 * safezoneH);
				shadow = 0;
				font = "LCD14";
                colorBackground[] = {0,0,0,0};
                colorText[] = {0,0,0,1};
            };
		};
	};
};