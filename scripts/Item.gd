class_name Item

var name: String
var id: int
var level: int
var stats: Stats
var thumbmail_path: String
var type: ITEMS

enum ITEMS {
  WEAPON,
  CHEST,
  LEGS,
  HELMET,
}

func _init(new_name: String, new_level: int, new_stats: Stats, new_type: ITEMS, new_id:int):
  name = new_name
  level = new_level
  stats = new_stats
  id = new_id
  type = new_type
