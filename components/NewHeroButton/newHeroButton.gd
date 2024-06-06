extends Button

var heroCost: int
var heroID: Hero.HEROID
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_pressed():
	if MoneyHandler.getCurrentMoney() >= heroCost:
		MoneyHandler.decreaseMoney(heroCost)
		if Heroes.listOfHeroes.size() > GameState.obtainedHeroes.size():
			var newHero = Hero.new(heroID, 1, Stats.new(20,10,0))
			newHero.create()
