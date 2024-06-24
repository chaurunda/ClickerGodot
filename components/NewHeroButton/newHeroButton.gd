extends Button

var heroCost: int
var heroID: HeroManager.HEROID
var heroName: String
# Called when the node enters the scene tree for the first time.

func _on_pressed():
	if MoneyHandler.getCurrentMoney() >= heroCost:
		MoneyHandler.decreaseMoney(heroCost)
		var newHero = Hero.new(heroID, 1, Stats.new(20,10,0), heroName)
		newHero.create()
