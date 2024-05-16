class_name HeroManager

func setObtainedHeroes(newHero):

	GlobalEventBus.newHeroObtained.emit(newHero)
	GameState.obtainedHeroes.push_back(newHero)

func getListOfHeroes():
	return GameState.obtainedHeroes
