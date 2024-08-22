extends Node

var list_of_item_name = []

var items = Items.new()

func get_obtained_items() :
	return GameState.obtained_items

func find_item_by_id(id: int) -> Item:
	var obtained_items = get_available_items()
	for item in obtained_items :
		if item.id == id :
			return item
	return

func find_all_obtained_items_by_type(type: Item.ITEMS) -> Array[Item] :
	var obtained_items = get_obtained_items()
	var result = []
	for item in obtained_items :
		if item.type == type :
			result.append(item)
	return result

func set_obtained_item(id: int) :
	var item = find_item_by_id(id)
	if (item) :
		GameState.obtained_items.push_back(item)
	# Handle error

func generate_new_item():
	pass

func get_available_items():
	return items.available_items()

