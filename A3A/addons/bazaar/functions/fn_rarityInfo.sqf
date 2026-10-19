// Rarity tier -> [name, hex colour, roll weight, price markup, RGBA colour]
params [["_tier", 0, [0]]];
[
	["Common",   "#c8c8c8", 50, 1,    [0.78, 0.78, 0.78, 1]],
	["Uncommon", "#7fd47f", 30, 1.25, [0.5, 0.83, 0.5, 1]],
	["Rare",     "#5ab0ff", 15, 1.6,  [0.35, 0.69, 1, 1]],
	["Exotic",   "#d98cff", 5,  2.2,  [0.85, 0.55, 1, 1]]
] select ((_tier max 0) min 3)
