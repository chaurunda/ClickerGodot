extends Node

func create_item_table(database: SQLite):
  database.drop_table(GameState.ITEMS_TABLE_NAME)
  var item_table = {
    "id": {"data_type": "int", "primary_key": true, "auto_increment": true},
    "name": {"data_type": "TEXT", "not_null": true},
    "level": {"data_type": "INTEGER", "not_null": true},
    "rarity": {"data_type": "TEXT", "not_null": true},
    "stats": {"data_type": "TEXT", "not_null": true},
    "type": {"data_type": "TEXT", "not_null": true}
  }
  database.create_table(GameState.ITEMS_TABLE_NAME, item_table)
  var items = Items.new()
  var list_of_items_name: Array = items.available_items()
  for item in list_of_items_name:
    add_item(item)

func create_obtainable_item(database):
  database.drop_table(GameState.OBTAINED_ITEMS_TABLE_NAME)
  var obtained_items_table = {
    "item_id": {"data_type": "int", "not_null": true}
  }
  database.create_table(GameState.OBTAINED_ITEMS_TABLE_NAME, obtained_items_table)

func add_item(item):
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
    "stats": JSON.stringify(stats),
    "type": item.type
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
    "stats": JSON.stringify(stats),
    "type": item.type
  }
  database.update_row(GameState.ITEMS_TABLE_NAME, item_data_dict, "id = '{id}'".format({"id": item.id}))

func add_obtained_item(id):
  var database = DbManager.connect_to_database()
  database.insert_row(GameState.OBTAINED_ITEMS_TABLE_NAME, {"item_id": id})

func get_items_list():
  var database = DbManager.connect_to_database()
  var item_list = database.select_rows(GameState.ITEMS_TABLE_NAME, "", ["id", "name", "rarity", "level", "stats", "type"])
  return item_list

func find_item_by_id_and_return_item(id: int) -> Item:
  var database = DbManager.connect_to_database()
  var item = database.select_rows(GameState.ITEMS_TABLE_NAME, "id = '{id}'".format({"id": id}), ["id", "name", "rarity", "level", "stats", "type"])
  if item.size() > 0:
    var item_data = item[0]
    var json = JSON.new()
    var error = json.parse(item_data["stats"])
    if error == OK:
      var data_received = json.data
      return Item.new(item_data["name"], item_data["level"], Stats.new(data_received.health, data_received.attack, data_received.armor), int(item_data["type"]), int(item_data["rarity"]), data_received.id)
    else:
      print("JSON Parse Error: ", json.get_error_message(), " at line ", json.get_error_line())
  return
