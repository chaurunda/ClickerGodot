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
  var list_of_heros_name = Heroes.listOfHeroName
  for hero in list_of_heros_name:
    var hero_data_dict = {
      "id": hero.id,
      "name": hero.name,
      "level": 1,
      "rarity": hero.rarity
    }
    database.insert_row(GameState.HERO_TABLE_NAME, hero_data_dict)
    database.close_db()

func create_hero_obtained_table(database: SQLite):
  database.drop_table(GameState.OBTAINED_HERO_TABLE_NAME)
  var hero_obtained_table = {
    "hero_id": {"data_type": "int", "not_null": true}
  }
  database.create_table(GameState.OBTAINED_HERO_TABLE_NAME, hero_obtained_table)
  database.close_db()

func add_hero(hero: Hero):
  var database = DbManager.connect_to_database()
  var hero_data_dict = {
    "id": hero.id,
    "name": hero.name,
    "level": hero.level,
    "rarity": hero.rarity
  }
  database.insert_row(GameState.HERO_TABLE_NAME, hero_data_dict)
  database.close_db()

func update_hero(hero: Hero):
  var database = DbManager.connect_to_database()
  var hero_data_dict = {
    "id": hero.id,
    "name": hero.name,
    "level": hero.level,
    "rarity": hero.rarity
  }
  database.update_row(GameState.HERO_TABLE_NAME, hero_data_dict, "id = '{id}'".format({"id": hero.id}))
  database.close_db()

func set_obtained_hero_by_id(hero_id: int):
  var database = DbManager.connect_to_database()
  var data = {
    "hero_id": hero_id
  }
  database.insert_row(GameState.OBTAINED_HERO_TABLE_NAME, data)
  database.close_db()
