extends Node

func getItems() :
	return GameState.obtainedItems

func findAllItemByType(type: Item.ITEMS) -> Array[Item] :
	var items = getItems()
	var result = []
	for item in items :
		if item.type == type :
			result.append(item)
	return result

func setObtainItem(item: Item) :
	GameState.obtainedItems.push_back(item)

func generateNewItem():
	pass

