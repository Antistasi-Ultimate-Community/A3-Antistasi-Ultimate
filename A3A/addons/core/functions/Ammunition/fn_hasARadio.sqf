/*
Author: Håkon
Description:
    checks if passed unit has a radio or backpack radio.
    compatible with vanilla, TFAR, and vn

    (ACRE have radios as generic items, will have to do some digging to adde support for them)

Argument: <Object> Unit to check if has a radio

Return Value: <Bool> unit has radio or backpack radio

Scope: Any
Environment: Any
Public: Yes
Dependencies:
Performance: 0.009 - 0.011ms

Example: _unit call A3A_fnc_hasRadio;

License: MIT License
*/
(_this getSlotItemName 611 isNotEqualTo "") || { backpack _this in allBackpacksRadio };
