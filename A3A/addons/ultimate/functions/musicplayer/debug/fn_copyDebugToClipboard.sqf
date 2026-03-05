//fn_copyToClipboard
#include "..\script_component.hpp"
/*
    Копирует содержимое отладочной панели в буфер обмена.
    Вызывается по нажатию на кнопку с иконкой копирования.
*/
private _display = findDisplay 85000;
if (isNull _display) exitWith {};

private _debugTextCtrl = _display displayCtrl 85121;
if (isNull _debugTextCtrl) exitWith {};

private _trackClass = A3U_currentTrack#1;
// Получаем текст структурированного текста (он возвращается с тегами)
private _rawText = [_trackClass] call A3U_fnc_getTrackDebugInfo;
private _textWithTags = ctrlText _debugTextCtrl;

// Сначала заменяем <br/> на реальный перевод строки
private _withNewLines = _rawText regexReplace ["<br\s*/?>", "\n"];
// Удаляем HTML-теги, оставляя чистый текст
private _cleanText = _withNewLines regexReplace ["<[^>]*>", ""];

// Копируем в буфер обмена
copyToClipboard _cleanText;

// Визуальный фидбек (опционально)
systemChat "Дебаг-информация скопирована в буфер обмена";