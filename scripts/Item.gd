class_name Item

var stuffname: String
var level: int
var stat: Stats

enum ITEMS {
  WEAPON,
  CHEST,
  LEGS,
  HELMET,
}

func _init(newName: String, newLevel: int, newStat: Stats):
  stuffname = newName
  level = newLevel
  stat = newStat
