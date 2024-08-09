extends Button

var heroCost: int
var heroID: HeroManager.HEROID
var heroName: String
# Called when the node enters the scene tree for the first time.

func _on_pressed():
	if MoneyHandler.get_current_money() >= heroCost:
		MoneyHandler.decrease_money(heroCost)
		var newHero = Hero.new(heroID, 1, Stats.new(20,10,0), heroName)
		newHero.create()
