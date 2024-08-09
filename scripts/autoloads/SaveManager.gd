extends Node

const SAVE_PATH = "user://clicker.save"

func save():
	var save_game = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var save_state = {
		"money": MoneyHandler.getCurrentMoney(),
		"obtainedHeroes": HeroManager.saveObtainedHeroes(),
		"buildings": []
	}

	for node in get_tree().get_nodes_in_group("Savable"):
		if node.scene_file_path.is_empty():
			print("persistent node '%s' is not an instanced scene, skipped" % node.name)
			continue
		if !node.has_method("save"):
			print("persistent node '%s' is missing a save() function, skipped" % node.name)
			continue
		save_state["buildings"].append(node.call("save"))

	save_game.store_string(JSON.stringify(save_state))
	save_game.close()

func load():
	if not FileAccess.file_exists(SAVE_PATH):
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

	if "money" in node_data:
		MoneyHandler.setCurrentMoney(node_data["money"])

	if "obtainedHeroes" in node_data:
		for heroData in node_data["obtainedHeroes"]:
			print(heroData)
			var newHero = Hero.new(heroData.id, heroData.level, Stats.new(heroData.health, heroData.attack, heroData.armor), heroData.heroName)
			newHero.create()
			pass

func has_save():
	return FileAccess.file_exists(SAVE_PATH)

