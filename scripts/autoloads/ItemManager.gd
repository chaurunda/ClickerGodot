extends Node

var list_of_item_name = []

func get_items() :
	return GameState.obtained_items

func find_all_items_by_type(type: Item.ITEMS) -> Array[Item] :
	var items = get_items()
	var result = []
	for item in items :
		if item.type == type :
			result.append(item)
	return result

func set_obtained_item(item: Item) :
	GameState.obtained_items.push_back(item)

func generate_new_item():
	pass

