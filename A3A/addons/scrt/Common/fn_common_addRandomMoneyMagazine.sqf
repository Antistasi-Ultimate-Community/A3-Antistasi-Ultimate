params ["_soldier", "_chance"];

if(random 100 < _chance) then {
    _moneyType = selectRandom arrayMoney;
    _soldier addMagazine [_moneyType, 1];
};
