extends Control




func _on_skirmish_pressed() -> void:
	pass # Replace with function body.


func _on_map_creation_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/MapGenerator.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()
