// Rarity tier from a base price: 0 Common, 1 Uncommon, 2 Rare, 3 Exotic.
params [["_price", 0, [0]]];
switch (true) do {
	case (_price < 100): { 0 };
	case (_price < 500): { 1 };
	case (_price < 1500): { 2 };
	default { 3 };
}
