class_name Heroes

var current_selected_hero: Hero = null

enum RARITY {
	COMMON,
	UNCOMMON,
	RARE,
	LEGENDARY,
}

enum HEROID {
	JOHN_DOE = 0,
	SERAPHINE_WILDHEART = 1,
	RODERIC_BLOODCLAW = 2,
	SYLX_SHADOWCLOAK = 3,
	ALARIC_GLOOMGAZER = 4,
	VALARA_WINDWHISPER = 5,
	LYRIANELM = 6,
	AERIS_WINDWHISPER = 7,
	TEYRION_LEAFWHISPER = 8,
	NARIELIS = 9,
	FINNIAN_STORMBORN = 10,
	VAELEN_FROSTBANE = 11,
	ALDRIC_STORMRAGE = 12,
	DRAEKOS = 13,
	ZEPHYRATH_DRAKEMOON = 14,
	GRULMOK = 15,
}

const listOfHeroName = [
	{
		"name": "Seraphine Wildheart",
		"rarity": RARITY.COMMON,
		"id": HEROID.SERAPHINE_WILDHEART,
	},
	{
		"name": "Roderic Bloodclaw",
		"rarity": RARITY.COMMON,
		"id": HEROID.RODERIC_BLOODCLAW,
	},
	{
		"name": "Sylx Shadowcloak",
		"rarity": RARITY.COMMON,
		"id": HEROID.SYLX_SHADOWCLOAK,
	},
	{
		"name":"Alaric Gloomgazer",
		"rarity": RARITY.COMMON,
		"id": HEROID.ALARIC_GLOOMGAZER,
	},
	{
		"name":"Valara Windwhisper",
		"rarity": RARITY.COMMON,
		"id": HEROID.VALARA_WINDWHISPER,
	},
	{
		"name":"Lyrianelm",
		"rarity": RARITY.COMMON,
		"id": HEROID.LYRIANELM,
	},
	{
		"name":"Aeris Windwhisper",
		"rarity": RARITY.COMMON,
		"id": HEROID.AERIS_WINDWHISPER,
	},
	{
		"name":"Teyrion Leafwhisper",
		"rarity": RARITY.COMMON,
		"id": HEROID.TEYRION_LEAFWHISPER,
	},
	{
		"name":"Narielis",
		"rarity": RARITY.UNCOMMON,
		"id": HEROID.NARIELIS,
	},
	{
		"name":"Finnian Stormborn",
		"rarity": RARITY.UNCOMMON,
		"id": HEROID.FINNIAN_STORMBORN,
	},
	{
		"name":"Vaelen Frostbane",
		"rarity": RARITY.UNCOMMON,
		"id": HEROID.VAELEN_FROSTBANE,
	},
	{
		"name":"Aldric Stormrage",
		"rarity": RARITY.UNCOMMON,
		"id": HEROID.ALDRIC_STORMRAGE,
	},
	{
		"name":"Draekos",
		"rarity": RARITY.RARE,
		"id": HEROID.DRAEKOS,
	},
	{
		"name":"Zephyrath Drakemoon",
		"rarity": RARITY.RARE,
		"id": HEROID.ZEPHYRATH_DRAKEMOON,
	},
	{
		"name":"Grulmok",
		"rarity": RARITY.LEGENDARY,
		"id": HEROID.GRULMOK,
	},
]


func get_hero(id: HEROID):
	for hero in GameState.obtained_heroes:
		if hero.uuid == id:
			return hero
	return null

func set_current_hero_selected(id: HEROID):
	current_selected_hero = get_hero(id)

func get_current_Hero_selected():
	return current_selected_hero

func get_list_of_heroes():
	return GameState.obtained_heroes
