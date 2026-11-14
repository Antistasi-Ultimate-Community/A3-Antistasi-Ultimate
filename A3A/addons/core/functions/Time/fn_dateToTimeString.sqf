params ["_date"];

format ["%1:%2",
	(["", "0"] select (_date select 3 < 10)) + str (_date select 3),
	(["", "0"] select (_date select 4 < 10)) + str (_date select 4)];
