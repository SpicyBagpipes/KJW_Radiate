#include "XEH_PREP.sqf"
/*
 *  Author: KJW
 * 
 *  Handles preinit for the addon
 * 
 *  Arguments:
 *  None
 * 
 *  Return Value:
 *  None
 * 
 *  Example:
 *  call KJW_Radiate_Core_XEH_PreInit
 * 
 *  Public: No
 */

call FUNC(addSettings);
call FUNC(addKeybinds);

GVAR(sources) = [];
GVAR(zones) = [];