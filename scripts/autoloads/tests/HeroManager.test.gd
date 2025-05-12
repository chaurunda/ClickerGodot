extends GutTest

var heroes

func before_each():
  heroes = Heroes.new()

func after_each():
  GameState.obtained_heroes = []

func test_set_obtained_heroes():
  # Arrange
  var hero = Hero.new(heroes.HEROID.AERIS_WINDWHISPER, 1, Stats.new(1,1,1), "")
  watch_signals(GlobalEventBus)
  # Act
  HeroManager.set_obtained_heroes(hero)
  # Assert
  assert_signal_emitted(GlobalEventBus, "new_hero_obtained")


func test_get_list_of_heroes_empty():
  # Arrange
  # Act
  var heroes_list = heroes.get_list_of_heroes()

  # Assert
  assert_eq(heroes_list, [])

func test_get_list_of_heroes_filled():
  # Arrange
  var hero = Hero.new(heroes.HEROID.AERIS_WINDWHISPER, 1, Stats.new(1,1,1), "")
  var heroes_list = heroes.get_list_of_heroes()

  # Act
  HeroManager.set_obtained_heroes(hero)

  # Assert
  assert_eq(heroes_list, [hero])

func test_set_current_hero_selected():
  # Arrange
  var hero = Hero.new(heroes.HEROID.AERIS_WINDWHISPER, 1, Stats.new(1,1,1), "")
  HeroManager.set_obtained_heroes(hero)

  # Act
  heroes.set_current_hero_selected(heroes.HEROID.AERIS_WINDWHISPER)

  # Assert
  assert_eq(heroes.current_selected_hero, hero)

func test_get_current_hero_selected():
  # Arrange
  var hero = Hero.new(heroes.HEROID.AERIS_WINDWHISPER, 1, Stats.new(1,1,1), "")
  HeroManager.set_obtained_heroes(hero)
  heroes.set_current_hero_selected(heroes.HEROID.AERIS_WINDWHISPER)

  # §Act
  var selected_hero = heroes.get_current_Hero_selected()

  # Assert
  assert_eq(selected_hero, hero)


func test_get_hero_obtained():
  # Arrange
  var hero = Hero.new(heroes.HEROID.AERIS_WINDWHISPER, 1, Stats.new(1,1,1), "")
  HeroManager.set_obtained_heroes(hero)

  # Act
  var getted_hero = heroes.get_hero(heroes.HEROID.AERIS_WINDWHISPER)

  # Assert
  assert_eq(getted_hero, hero)

func test_get_hero_no_hero():
  # Arrange

  # Act
  var getted_hero = heroes.get_hero(heroes.HEROID.AERIS_WINDWHISPER)

  # Assert
  assert_eq(getted_hero, null)

func test_save_obtained_hero():
  # Arrange
  var hero = Hero.new(heroes.HEROID.AERIS_WINDWHISPER, 1, Stats.new(1,1,1), "")
  HeroManager.set_obtained_heroes(hero)
  var save_mock = [
	{
			"level": 1,
			"id": 7,
			"health": 1,
			"attack": 1,
			"armor": 1,
			"hero_name":"",
		}
  ]

  # Act
  var save_data = HeroManager.save_obtained_heroes()

  # Assert
  assert_eq(save_data, save_mock)
