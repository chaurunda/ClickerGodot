extends Node

func save():
	var save_game = FileAccess.open("user://clicker.save", FileAccess.WRITE)
	var saveState = {
		"money": MoneyHandler.getCurrentMoney(),
		"obtainedHeroes": HeroManager.saveObtainedHeroes()
	}
	var buildingSave = []

	var save_nodes = get_tree().get_nodes_in_group("Savable")
	for node in save_nodes:
		if node.scene_file_path.is_empty():
			print("persistent node '%s' is not an instanced scene, skipped" % node.name)
			continue

		# Check the node has a save function.
		if !node.has_method("save"):
			print("persistent node '%s' is missing a save() function, skipped" % node.name)
			continue

		buildingSave.append(node.call("save"))

	saveState["buildings"] = buildingSave
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
			var newHero = Hero.new(heroData.id, heroData.level, Stats.new(heroData.health, heroData.attack, heroData.armor), heroData.name)
			newHero.create()
			pass

func hasSave():
	return FileAccess.file_exists("user://clicker.save")

