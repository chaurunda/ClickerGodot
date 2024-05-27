class_name Item

const uuid_util = preload("res://addons/uuid.gd")

var stuffname: String
var id: String
var level: int
var stat: Stats
var thumbmailPath: String

enum ITEMS {
  WEAPON,
  CHEST,
  LEGS,
  HELMET,
}

func _init(newName: String, newLevel: int, newStat: Stats, type: ITEMS):
  stuffname = newName
  level = newLevel
  stat = newStat
  id = uuid_util.v4()
