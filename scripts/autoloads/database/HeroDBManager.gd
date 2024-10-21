extends Node

func get_heros_list():
  var database = DbManager.connect_to_database()
  var hero_list = database.select_rows(GameState.HERO_TABLE_NAME, "", ["id", "name", "rarity"])
  return hero_list

func get_hero(id):
  var database = DbManager.connect_to_database()
  var hero = database.select_rows(GameState.HERO_TABLE_NAME, "id = '{id}'".format({"id": id}), ["id", "name", "level", "rarity"])
  return hero

func create_hero_table(database: SQLite):
  database.drop_table(GameState.HERO_TABLE_NAME)
  var hero_table = {
		"id": {"data_type": "int", "primary_key": true, "not_null": true},
		"name": {"data_type": "TEXT", "not_null": true},
		"level": {"data_type": "int", "not_null": true},
		"rarity": {"data_type": "TEXT", "not_null": true},
	}
  database.create_table(GameState.HERO_TABLE_NAME, hero_table)
  var list_of_heros_name = HeroManager.listOfHeroName
  for hero in list_of_heros_name:
    var hero_data_dict = {
      "id": hero.id,
      "name": hero.name,
      "level": 1,
      "rarity": hero.rarity
    }
    database.insert_row(GameState.HERO_TABLE_NAME, hero_data_dict)

func create_hero_obtained_table(database: SQLite):
  database.drop_table(GameState.OBTAINED_HERO_TABLE_NAME)
  var hero_obtained_table = {
    "hero_id": {"data_type": "int", "not_null": true}
  }
  database.create_table(GameState.OBTAINED_HERO_TABLE_NAME, hero_obtained_table)

func add_hero(hero: Hero):
  var database = DbManager.connect_to_database()
  var hero_data_dict = {
    "id": hero.id,
    "name": hero.name,
    "level": hero.level,
    "rarity": hero.rarity
  }
  database.insert_row(GameState.HERO_TABLE_NAME, hero_data_dict)


func update_hero(hero: Hero):
  var database = DbManager.connect_to_database()
  var hero_data_dict = {
    "id": hero.id,
    "name": hero.name,
    "level": hero.level,
    "rarity": hero.rarity
  }
  database.update_row(GameState.HERO_TABLE_NAME, hero_data_dict, "id = '{id}'".format({"id": hero.id}))
