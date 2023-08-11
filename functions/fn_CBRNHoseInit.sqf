/*
	THIS FUNCTION IS THE SAME AS bin_fnc_CBRNHoseInit BUT MADE MP COMPATIBLE AND PROPER HANDLING FOR ALL ITEMS AND ACE ARSENAL.
*/
params["_unit"];

// Run only on local units
if(!local _unit)exitWith{};

_gear			= goggles _unit;
_backpack		= backpackContainer _unit;
_backpackType	= backpack _unit;
switch(true) do
{
	case (_gear in ["G_AirPurifyingRespirator_01_F", "G_AirPurifyingRespirator_01_nofilter_F"]):
	{

		//Show the correct hoses for the backpack combi
		switch true do
		{
			case (_backpackType == "B_CombinationUnitRespirator_01_F"):
			{
				//Switch to APR without filter
				_unit linkItem "G_AirPurifyingRespirator_01_nofilter_F";

				_backpack setObjectTextureGlobal [1, "a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
				_backpack setObjectTextureGlobal [2, "a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
				_backpack setObjectTextureGlobal [3, ""];
			};
			case (_backpackType == "B_SCBA_01_F"):
			{
				//Switch to APR without filter
				_unit linkItem "G_AirPurifyingRespirator_01_nofilter_F";

				_backpack setObjectTextureGlobal [1, "a3\supplies_f_enoch\bags\data\b_scba_01_co.paa"];
				_backpack setObjectTextureGlobal [2, ""];
			};
			default {
				_unit linkItem "G_AirPurifyingRespirator_01_F";
				if (_backpackType == "B_CombinationUnitRespirator_01_F") then {
					_backpack setObjectTextureGlobal [1, ""];
					_backpack setObjectTextureGlobal [2, ""];
					_backpack setObjectTextureGlobal [3, ""];
				};
				if (_backpackType == "B_SCBA_01_F") then {
					_backpack setObjectTextureGlobal [1, ""];
					_backpack setObjectTextureGlobal [2, ""];
				};
			};
		};
	};
	case (_gear in ["G_AirPurifyingRespirator_02_black_F", "G_AirPurifyingRespirator_02_olive_F", "G_AirPurifyingRespirator_02_sand_F"]):
	{
		//Hide the hoses for the backpack combi
		switch true do
		{
			case (_backpackType == "B_CombinationUnitRespirator_01_F"):
			{
				_backpack setObjectTextureGlobal [1, ""];
				_backpack setObjectTextureGlobal [2, ""];
				_backpack setObjectTextureGlobal [3, ""];
			};
			case (_backpackType == "B_SCBA_01_F"):
			{
				_backpack setObjectTextureGlobal [1, ""];
				_backpack setObjectTextureGlobal [2, ""];
			};
		};
	};
	case (_gear == "G_RegulatorMask_F"):
	{
		//Show the correct hoses for the backpack combi
		switch true do
		{
			case (_backpackType == "B_CombinationUnitRespirator_01_F"):
			{
				_backpack setObjectTextureGlobal [1, "a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
				_backpack setObjectTextureGlobal [2, ""];
				_backpack setObjectTextureGlobal [3, "a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
			};
			case (_backpackType == "B_SCBA_01_F"):
			{
				_backpack setObjectTextureGlobal [1, ""];
				_backpack setObjectTextureGlobal [2, "a3\supplies_f_enoch\bags\data\b_scba_01_co.paa"];
			};
			default {
				if (_backpackType == "B_CombinationUnitRespirator_01_F") then {
					_backpack setObjectTextureGlobal [1, "a3\supplies_f_enoch\bags\data\b_cur_01_co.paa"];
					_backpack setObjectTextureGlobal [2, ""];
					_backpack setObjectTextureGlobal [3, ""];
				};
				if (_backpackType == "B_SCBA_01_F") then {
					_backpack setObjectTextureGlobal [1, ""];
					_backpack setObjectTextureGlobal [2, ""];
				};
			};
		};
	};
	default {
		if (_backpackType == "B_CombinationUnitRespirator_01_F") then {
			_backpack setObjectTextureGlobal [1, ""];
			_backpack setObjectTextureGlobal [2, ""];
			_backpack setObjectTextureGlobal [3, ""];
		};
		if (_backpackType == "B_SCBA_01_F") then {
			_backpack setObjectTextureGlobal [1, ""];
			_backpack setObjectTextureGlobal [2, ""];
		};
	};
};