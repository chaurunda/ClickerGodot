extends Node

func new_game():
  var database = connect_to_database()
  HeroDbManager.create_hero_table(database)
  HeroDbManager.create_hero_obtained_table(database)
  ItemDbManager.create_item_table(database)
  ItemDbManager.create_obtainable_item(database)


func connect_to_database():
  var database = SQLite.new()
  database.path = "res://database/{database}.db".format({"database": GameState.DATABASE_NAME})
  database.open_db()
  return database

func reset():
  var database = connect_to_database()
  database.drop_table(GameState.HERO_TABLE_NAME)
  database.drop_table(GameState.ITEMS_TABLE_NAME)
  database.drop_table(GameState.OBTAINED_ITEMS_TABLE_NAME)
