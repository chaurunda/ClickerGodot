extends Button

var hero_cost: int
var hero_id: Heroes.HEROID
var hero_name: String

func _on_pressed():
	if MoneyHandler.get_current_money() >= hero_cost:
		MoneyHandler.decrease_money(hero_cost)
		var new_hero = Hero.new(hero_id, 1, Stats.new(20,10,0), hero_name)
		new_hero.create()
		self.queue_free()
