extends Node

var currentSelectedHero: Hero = null

var database = SQLite.new()
const uuid_util = preload('res://addons/uuid.gd')

const listOfHeroName = [
	{
		"name": "Seraphine Wildheart",
		"cost": 200,
		"id": Hero.HEROID.SERAPHINE_WILDHEART,
	},
	{
		"name": "Roderic Bloodclaw",
		"cost": 200,
		"id": Hero.HEROID.RODERIC_BLOODCLAW,
	},
	{
		"name": "Sylx Shadowcloak",
		"cost": 200,
		"id": Hero.HEROID.SYLX_SHADOWCLOAK,
	},
	{
		"name":"Alaric Gloomgazer",
		"cost": 200,
		"id": Hero.HEROID.ALARIC_GLOOMGAZER,
	},
	{
		"name":"Valara Windwhisper",
		"cost": 200,
		"id": Hero.HEROID.VALARA_WINDWHISPER,
	},
	{
		"name":"Lyrianelm",
		"cost": 200,
		"id": Hero.HEROID.LYRIANELM,
	},
	{
		"name":"Aeris Windwhisper",
		"cost": 200,
		"id": Hero.HEROID.AERIS_WINDWHISPER,
	},
	{
		"name":"Teyrion Leafwhisper",
		"cost": 200,
		"id": Hero.HEROID.TEYRION_LEAFWHISPER,
	},
	{
		"name":"Narielis",
		"cost": 600,
		"id": Hero.HEROID.NARIELIS,
	},
	{
		"name":"Finnian Stormborn",
		"cost": 600,
		"id": Hero.HEROID.FINNIAN_STORMBORN,
	},
	{
		"name":"Vaelen Frostbane",
		"cost": 600,
		"id": Hero.HEROID.VAELEN_FROSTBANE,
	},
	{
		"name":"Aldric Stormrage",
		"cost": 600,
		"id": Hero.HEROID.ALDRIC_STORMRAGE,
	},
	{
		"name":"Draekos",
		"cost": 1500,
		"id": Hero.HEROID.DRAEKOS,
	},
	{
		"name":"Zephyrath Drakemoon",
		"cost": 1500,
		"id": Hero.HEROID.ZEPHYRATH_DRAKEMOON,
	},
	{
		"name":"Grulmok",
		"cost": 10000,
		"id": Hero.HEROID.GRULMOK,
	},
]

func setObtainedHeroes(newHero: Hero):
	GameState.obtainedHeroes.push_back(newHero)
	GlobalEventBus.newHeroObtained.emit()

func getListOfHeroes():
	testDatabase()
	return GameState.obtainedHeroes

func setCurrentHeroSelected(id: Hero.HEROID):
	currentSelectedHero = getHero(id)

func getCurrentHeroSelected():
	return currentSelectedHero

func getHero(id: Hero.HEROID):
	for hero in GameState.obtainedHeroes:
		if hero.uuid == id:
			return hero
	return null

func saveObtainedHeroes():
	var obtainedHeroes = HeroManager.getListOfHeroes()
	var obtainedHeroesData = []
	for hero in obtainedHeroes:
		var heroData = {
			"level": hero.level,
			"id": hero.uuid,
			"health": hero.currentStats.health,
			"attack": hero.currentStats.attack,
			"armor": hero.currentStats.armor,
		}
		obtainedHeroesData.append(heroData)

		pass
	return obtainedHeroesData

func testDatabase():
	database.path = "res://database/hero.db"
	database.open_db()
	var table = {
		"id": {"data_type": "TEXT", "primary_key": true, "not_null": true},
		"name": {"data_type": "TEXT", "not_null": true},
	}
	# database.create_table("heroes", table)
	var data = {
		"id": uuid_util.v4(),
		"name": "Seraphine Wildheart",
	}
	# database.insert_row("heroes", data)
	print(database.select_rows("heroes", "", ["id", "name"]))
