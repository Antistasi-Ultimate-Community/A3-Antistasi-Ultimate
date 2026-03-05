//fn_shuffle
#include "..\..\script_component.hpp"
/*
    Переключает режим перемешивания (shuffle).
    Вызывается при нажатии на кнопку shuffle.
*/
private _display = findDisplay 85000;
if (isNull _display) exitWith {};

private _shuffleBtn = _display displayCtrl 85114;
if (isNull _shuffleBtn) exitWith {};

// Переключаем переменную
if (isNil "A3U_shuffleEnabled") then { A3U_shuffleEnabled = false; };
A3U_shuffleEnabled = !A3U_shuffleEnabled;

// Меняем внешний вид кнопки
if (A3U_shuffleEnabled) then {
    // Включено: можно подсветить другим цветом фона или сменить иконку на "активную"
    _shuffleBtn ctrlSetBackgroundColor [0.2,0.6,0.2,1]; // зелёный оттенок
    _shuffleBtn ctrlSetTooltip "Случайный порядок (вкл)";
} else {
    // Выключено: возвращаем обычный вид
    _shuffleBtn ctrlSetBackgroundColor [0.2,0.2,0.2,1];
    _shuffleBtn ctrlSetTooltip "Случайный порядок (выкл)";
};

// Можно также вывести сообщение в systemChat для отладки
systemChat format ["Shuffle %1", ["выключен","включён"] select A3U_shuffleEnabled];