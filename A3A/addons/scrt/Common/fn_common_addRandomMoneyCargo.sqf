params ["_vehicle", "_chance", "_amount"];

if(_amount == 0) exitWith {};

_probability = random 100;

if(_chance >= _probability) then {
    _moneyType = selectRandom arrayMoney;
    _vehicle addMagazineCargoGlobal [_moneyType, _amount];
};
