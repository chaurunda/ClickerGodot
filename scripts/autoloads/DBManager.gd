extends Node


func newGame():
  var database = SQLite.new()
  database.path = "res://database/{tableName}.db".format({"tableName": GameState.tableName})
  database.open_db()
  createHeroTable(database)

func getHerosList():
  var database = SQLite.new()
  database.path = "res://database/{tableName}.db".format({"tableName": GameState.tableName})
  database.open_db()
  var heroList = database.select_rows("heroes", "", ["id", "name", "rarity"])
  return heroList

func getHero(id):
  var database = SQLite.new()
  database.path = "res://database/{tableName}.db".format({"tableName": GameState.tableName})
  database.open_db()
  var hero = database.select_rows("heroes", "id = '{id}'".format({"id": id}), ["id", "name", "level", "rarity"])
  return hero

func createHeroTable(database: SQLite):
  database.drop_table("heroes")
  var heroTable = {
		"id": {"data_type": "TEXT", "primary_key": true, "not_null": true},
		"name": {"data_type": "TEXT", "not_null": true},
		"level": {"data_type": "INTEGER", "not_null": true},
		"rarity": {"data_type": "TEXT", "not_null": true},
	}
  database.create_table("heroes", heroTable)
  var listOfHerosName = HeroManager.listOfHeroName
  for hero in listOfHerosName:

    var heroDataDict = {
      "id": hero.id,
      "name": hero.name,
      "level": 1,
      "rarity": hero.rarity
    }
    database.insert_row("heroes", heroDataDict)

func createItemTable(database: SQLite):
  database.drop_table("items")
  var itemTable = {
    "id": {"data_type": "TEXT", "primary_key": true, "not_null": true},
    "name": {"data_type": "TEXT", "not_null": true},
    "level": {"data_type": "INTEGER", "not_null": true},
    "rarity": {"data_type": "TEXT", "not_null": true},
  }
  database.create_table("items", itemTable)
  var listOfItemsName = ItemManager.listOfItemName
  for item in listOfItemsName:

    var itemDataDict = {
      "id": item.id,
      "name": item.name,
      "level": 1,
      "rarity": item.rarity
    }
    database.insert_row("items", itemDataDict)
