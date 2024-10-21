extends Node

var heroes = Heroes.new()
func set_obtained_heroes(newHero: Hero):
	GameState.obtained_heroes.push_back(newHero)
	GlobalEventBus.new_hero_obtained.emit()

func save_obtained_heroes():
	var obtained_heroes = heroes.get_list_of_heroes()
	var obtained_heroesData = []
	for hero in obtained_heroes:
		var hero_data = {
			"level": hero.level,
			"id": hero.uuid,
			"health": hero.current_stats.health,
			"attack": hero.current_stats.attack,
			"armor": hero.current_stats.armor,
			"hero_name": hero.hero_name,
		}
		obtained_heroesData.append(hero_data)

		pass
	return obtained_heroesData

