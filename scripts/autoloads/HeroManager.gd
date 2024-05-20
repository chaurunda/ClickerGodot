extends Node

var currentSelectedHero: Hero = null

func setObtainedHeroes(newHero: Hero):
	GameState.obtainedHeroes.push_back(newHero)
	GlobalEventBus.newHeroObtained.emit()

func getListOfHeroes():
	return GameState.obtainedHeroes

func setCurrentHeroSelected(id: String):
	currentSelectedHero = getHero(id)

func getCurrentHeroSelected():
	return currentSelectedHero

func getHero(id: String):
	for hero in GameState.obtainedHeroes:
		if hero.uuid == id:
			return hero
	return null
