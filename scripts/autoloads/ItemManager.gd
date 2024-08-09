extends Node

var listOfItemName = []

func getItems() :
	return GameState.obtained_items

func findAllItemByType(type: Item.ITEMS) -> Array[Item] :
	var items = getItems()
	var result = []
	for item in items :
		if item.type == type :
			result.append(item)
	return result

func setObtainItem(item: Item) :
	GameState.obtained_items.push_back(item)

func generateNewItem():
	pass

