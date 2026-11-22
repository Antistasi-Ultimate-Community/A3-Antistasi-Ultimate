#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

private _owner = param [4];

if (_owner in hcArray) then
{
	Info_2("Headless client ID %1 disconnected from HC array %2",_owner,hcArray);
	if ({owner _x == _owner} count allUnits > 0) then
	{
		A3A_HCErrorHandle = [] spawn {
			while {true} do
			{
				[petros,"hint",localize "STR_hints_hc_restart", localize "STR_hints_hc_header"] remoteExec ["A3A_fnc_commsMP"];
				sleep 30;
			};
		};
	}
	else
	{
		hcArray = hcArray - [_owner];
	};
};
