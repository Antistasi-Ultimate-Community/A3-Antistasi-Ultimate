// SERVER: a line for the rumours ("everyone hears about it"): the last six
// smuggling-run outcomes, kept for an hour.
params [["_text", "", [""]]];
if (_text == "") exitWith {};
ABZ_runNews pushBack [time, _text];
private _keep = ABZ_runNews select { time - (_x select 0) < 3600 };
ABZ_runNews = _keep select [((count _keep) - 6) max 0];
