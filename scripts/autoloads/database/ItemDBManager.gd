extends Node

func create_item_table(database: SQLite):
  database.drop_table(GameState.ITEMS_TABLE_NAME)
  var item_table = {
    "id": {"data_type": "int", "primary_key": true, "auto_increment": true},
    "name": {"data_type": "TEXT", "not_null": true},
    "level": {"data_type": "INTEGER", "not_null": true},
    "rarity": {"data_type": "TEXT", "not_null": true},
    "stats": {"data_type": "TEXT", "not_null": true},
  }
  database.create_table(GameState.ITEMS_TABLE_NAME, item_table)
  var items = Items.new()
  var list_of_items_name: Array = items.available_items()
  for item in list_of_items_name:
    var stats = {
      "attack": item.stats.attack,
      "health": item.stats.health,
      "armor": item.stats.armor,
    }
    var item_data_dict = {
      "name": item.name,
      "level": 1,
      "rarity": item.rarity,
      "stats": JSON.stringify(stats)
    }
    database.insert_row(GameState.ITEMS_TABLE_NAME, item_data_dict)

func create_obtainable_item(database):
  database.drop_table(GameState.OBTAINED_ITEMS_TABLE_NAME)
  var obtained_items_table = {
    "item_id": {"data_type": "int", "not_null": true}
  }
  database.create_table(GameState.OBTAINED_ITEMS_TABLE_NAME, obtained_items_table)

func add_item(item: Item):
  var database = DbManager.connect_to_database()
  var stats = {
      "attack": item.stats.attack,
      "health": item.stats.health,
      "armor": item.stats.armor,
    }
  var item_data_dict = {
    "name": item.name,
    "level": item.level,
    "rarity": item.rarity,
    "stats": JSON.stringify(stats)
  }
  database.insert_row(GameState.ITEMS_TABLE_NAME, item_data_dict)

func update_item(item: Item):
  var database = DbManager.connect_to_database()
  var stats = {
      "attack": item.stats.attack,
      "health": item.stats.health,
      "armor": item.stats.armor,
    }
  var item_data_dict = {
    "name": item.name,
    "level": item.level,
    "rarity": item.rarity,
    "stats": JSON.stringify(stats)
  }
  database.update_row(GameState.ITEMS_TABLE_NAME, item_data_dict, "id = '{id}'".format({"id": item.id}))

func add_obtained_item(id):
  var database = DbManager.connect_to_database()
  database.insert_row(GameState.OBTAINED_ITEMS_TABLE_NAME, {"id": id})

func get_items_list():
  var database = DbManager.connect_to_database()
  var item_list = database.select_rows(GameState.ITEMS_TABLE_NAME, "", ["id", "name", "rarity", "level", "stats"])
  return item_list
