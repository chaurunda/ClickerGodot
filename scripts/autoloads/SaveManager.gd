extends Node

const SAVE_PATH = "user://clicker.save"

func save():
	var save_game = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var save_state = {
		"money": MoneyHandler.get_current_money(),
		"obtained_heroes": HeroManager.save_obtained_heroes(),
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
	var parsed_data = json.parse(data)
	if not parsed_data == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			return

	var node_data = json.get_data()

	if "money" in node_data:
		MoneyHandler.set_current_money(node_data["money"])

	if "obtained_heroes" in node_data:
		for hero_data in node_data["obtained_heroes"]:
			var newHero = Hero.new(hero_data.id, hero_data.level, Stats.new(hero_data.health, hero_data.attack, hero_data.armor), hero_data.hero_name)
			newHero.create()
			pass

func has_save():
	return FileAccess.file_exists(SAVE_PATH)

