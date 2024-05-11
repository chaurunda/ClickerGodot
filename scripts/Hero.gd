class_name Hero

var heroName: String
var level: int
var stat: Stats = Stats.new()
var weapon: Stuff
var helmet: Stuff
var chest: Stuff
var trousers: Stuff

func _init(newName: String, newLevel: int):
	heroName = newName
	level = newLevel
	stat.life = newLevel * 10
	stat.atk = newLevel * 10
	stat.def = newLevel * 5

