extends Control

signal values_changed

func _on_deep_ocean_scroll_value_changed(value: float) -> void:
	values_changed.emit("deep_water_value", value)
	
func _on_ocean_scroll_value_changed(value: float) -> void:
	values_changed.emit("shallow_water_value", value)
	
func _on_sand_scroll_value_changed(value: float) -> void:
	values_changed.emit("sand_value", value)

func _on_grass_land_scroll_value_changed(value: float) -> void:
	values_changed.emit("grassland_value", value)

func _on_forest_scroll_value_changed(value: float) -> void:
	values_changed.emit("forest_value", value)

func _on_low_land_scroll_value_changed(value: float) -> void:
	values_changed.emit("low_land_value", value)

func _on_high_land_scroll_value_changed(value: float) -> void:
	values_changed.emit("high_land_value", value)

func _on_mountain_scroll_value_changed(value: float) -> void:
	values_changed.emit("mountain_value", value)

func _on_button_pressed() -> void:
	values_changed.emit("generate", 1.0)

func _on_seed_2_value_changed(value: float) -> void:
	values_changed.emit("seed", value)

func _on_frequency_scroll_value_changed(value: float) -> void:
	var true_value = value / 10
	values_changed.emit("frequency", true_value)
