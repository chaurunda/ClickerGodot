class_name Item

var stuffname: String
var id: int
var level: int
var stat: Stats
var thumbmailPath: String
var type: ITEMS

enum ITEMS {
  WEAPON,
  CHEST,
  LEGS,
  HELMET,
}

func _init(newName: String, newLevel: int, newStat: Stats, newType: ITEMS, newId:int):
  stuffname = newName
  level = newLevel
  stat = newStat
  id = newId
  type = newType
