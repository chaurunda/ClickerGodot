extends Node


func new_game():
  var database = SQLite.new()
  database.path = "res://database/{table_name}.db".format({"table_name": GameState.table_name})
  database.open_db()
  create_hero_table(database)

func get_heros_list():
  var database = SQLite.new()
  database.path = "res://database/{table_name}.db".format({"table_name": GameState.table_name})
  database.open_db()
  var hero_list = database.select_rows("heroes", "", ["id", "name", "rarity"])
  return hero_list

func get_hero(id):
  var database = SQLite.new()
  database.path = "res://database/{table_name}.db".format({"table_name": GameState.table_name})
  database.open_db()
  var hero = database.select_rows("heroes", "id = '{id}'".format({"id": id}), ["id", "name", "level", "rarity"])
  return hero

func create_hero_table(database: SQLite):
  database.drop_table("heroes")
  var hero_table = {
		"id": {"data_type": "TEXT", "primary_key": true, "not_null": true},
		"name": {"data_type": "TEXT", "not_null": true},
		"level": {"data_type": "INTEGER", "not_null": true},
		"rarity": {"data_type": "TEXT", "not_null": true},
	}
  database.create_table("heroes", hero_table)
  var list_of_heros_name = HeroManager.listOfHeroName
  for hero in list_of_heros_name:

    var hero_data_dict = {
      "id": hero.id,
      "name": hero.name,
      "level": 1,
      "rarity": hero.rarity
    }
    database.insert_row("heroes", hero_data_dict)

func create_item_table(database: SQLite):
  database.drop_table("items")
  var item_table = {
    "id": {"data_type": "TEXT", "primary_key": true, "not_null": true},
    "name": {"data_type": "TEXT", "not_null": true},
    "level": {"data_type": "INTEGER", "not_null": true},
    "rarity": {"data_type": "TEXT", "not_null": true},
  }
  database.create_table("items", item_table)
  var list_of_items_name = ItemManager.listOfItemName
  for item in list_of_items_name:

    var item_data_dict = {
      "id": item.id,
      "name": item.name,
      "level": 1,
      "rarity": item.rarity
    }
    database.insert_row("items", item_data_dict)
