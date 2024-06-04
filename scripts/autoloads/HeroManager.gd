extends Node

var currentSelectedHero: Hero = null

func setObtainedHeroes(newHero: Hero):
	GameState.obtainedHeroes.push_back(newHero)
	GlobalEventBus.newHeroObtained.emit()

func getListOfHeroes():
	return GameState.obtainedHeroes

func setCurrentHeroSelected(id: Hero.HEROID):
	currentSelectedHero = getHero(id)

func getCurrentHeroSelected():
	return currentSelectedHero

func getHero(id: Hero.HEROID):
	for hero in GameState.obtainedHeroes:
		if hero.uuid == id:
			return hero
	return null

func saveObtainedHeroes():
	var obtainedHeroes = HeroManager.getListOfHeroes()
	var obtainedHeroesData = []
	for hero in obtainedHeroes:
		var heroData = {
			"level": hero.level,
			"id": hero.uuid,
			"health": hero.currentStats.health,
			"attack": hero.currentStats.attack,
			"armor": hero.currentStats.armor,
		}
		obtainedHeroesData.append(heroData)

		pass
	return obtainedHeroesData
