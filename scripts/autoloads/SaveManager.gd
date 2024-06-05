extends Node

func save():
	var save_game = FileAccess.open("user://clicker.save", FileAccess.WRITE)
	var saveState = {
		"money": MoneyHandler.getCurrentMoney(),
		"obtainedHeroes": HeroManager.saveObtainedHeroes(),
	}
	var json = JSON.stringify(saveState)
	save_game.store_string(json)
	save_game.close()

func load():
	if not FileAccess.file_exists("user://clicker.save"):
		return

	var save_game = FileAccess.open("user://clicker.save", FileAccess.READ)
	var json_string = save_game.get_line()
	var data = save_game.get_as_text()
	var json = JSON.new()
	var parsedData = json.parse(data)
	if not parsedData == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			return

	var node_data = json.get_data()

	## Load Money
	if "money" in node_data:
		MoneyHandler.setCurrentMoney(node_data["money"])

	## Load Obtained Heroes
	if "obtainedHeroes" in node_data:
		for heroData in node_data["obtainedHeroes"]:
			var newHero = Hero.new(heroData.id, heroData.level, Stats.new(heroData.health, heroData.attack, heroData.armor))
			newHero.create()
			pass

func hasSave():
	return FileAccess.file_exists("user://clicker.save")

