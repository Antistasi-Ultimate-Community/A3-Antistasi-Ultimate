#include "..\..\script_component.hpp"

private _display = findDisplay 85000;
private _ctrl = _display displayCtrl 85102;
private _count = lbSize _ctrl;
private _currentIndex = lbCurSel _ctrl;
private _newIndex = (_currentIndex + 1) min (_count - 1);

_ctrl lbSetCurSel _newIndex;