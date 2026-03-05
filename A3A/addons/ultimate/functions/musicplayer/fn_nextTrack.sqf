//fn_nextTrack.sqf
#include "..\..\script_component.hpp"

private _display = findDisplay 85000;
private _ctrl = _display displayCtrl 85102;
private _count = lbSize _ctrl;

if (_count == 0) exitWith {};

private _newIndex = 0;

if (A3U_shuffleEnabled) then {
    // Выбираем случайный трек, исключая текущий
    private _currentIndex = lbCurSel _ctrl;
    if (_count > 1) then {
        private _randomIndex = _currentIndex;
        while {_randomIndex == _currentIndex} do {
            _randomIndex = floor random _count;
        };
        _newIndex = _randomIndex;
    } else {
        _newIndex = 0; // если только один трек, оставляем его
    };
} else {
    // Обычный порядок
    private _currentIndex = lbCurSel _ctrl;
    _newIndex = (_currentIndex + 1) min (_count - 1);
};

_ctrl lbSetCurSel _newIndex;
