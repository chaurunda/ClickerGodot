extends Node

#####  MONEY #####
var currentMoney = 0

func increaseMoney(value: int):
	currentMoney += value

func decreaseMoney(value: int):
	currentMoney -= value


##### HEROES #####
var obtainedHeroes: Array[Hero]

func setObtainedHeroes(newHero):
	obtainedHeroes.push_back(newHero)

func getListOfHeroes():
	return obtainedHeroes
