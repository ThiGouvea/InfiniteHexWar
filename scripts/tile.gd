extends Node2D

@export var noise_height_texture : NoiseTexture2D
var noise : Noise

@onready var map_hexes: TileMapLayer = $MapHexes
var source_id = 0

var deep_water_atlas = Vector2i(3,0)
var deep_water_value : float = -0.5

var shallow_water_atlas = Vector2i(2,0)
var shallow_water_value : float = -0.2

var sand_land_atlas = Vector2i(6,0)
var sand_land_value : float = 0.1

var grass_land_atlas = Vector2i(4,0)
var grass_land_value : float = 0.2

var forest_atlas = Vector2i(5,0)
var forest_land_value : float = 0.3

var low_land_atlas = Vector2i(1,0)
var low_land_value : float = 0.5

var high_land_atlas = Vector2i(0,0)
var high_land_value : float = 0.6

var mountain_atlas = Vector2i(7,0)
var mountain_land_value : float = 0.7

var width : int = 600
var height : int = 400

func _ready() -> void:
	noise = noise_height_texture.noise
	generate_world()
	
func generate_world():
	for x in range(width):
		for y in range(height):
			var noise_val = noise.get_noise_2d(x,y)
			
			if noise_val >= sand_land_value and noise_val < grass_land_value:
				map_hexes.set_cell(Vector2i(x,y), source_id, sand_land_atlas)
				
			elif noise_val >= grass_land_value and noise_val < forest_land_value:
				map_hexes.set_cell(Vector2i(x,y), source_id, grass_land_atlas)
				
			elif noise_val >= forest_land_value and noise_val < low_land_value:
				map_hexes.set_cell(Vector2i(x,y), source_id, forest_atlas)
				
			elif noise_val >= low_land_value and noise_val < high_land_value:
				map_hexes.set_cell(Vector2i(x,y), source_id, low_land_atlas)
				
			elif noise_val >= high_land_value and noise_val < mountain_land_value:
				map_hexes.set_cell(Vector2i(x,y), source_id, high_land_atlas)
				
			elif noise_val >=mountain_land_value:
				map_hexes.set_cell(Vector2i(x,y), source_id, mountain_atlas)
				
			elif noise_val <= sand_land_value and noise_val > deep_water_value:
				map_hexes.set_cell(Vector2i(x,y), source_id, shallow_water_atlas)
				
			elif noise_val <= deep_water_value:
				map_hexes.set_cell(Vector2i(x,y), source_id, deep_water_atlas)


func _on_hud_values_changed(value_name, value) -> void:
	if value_name == "deep_water_value":
		deep_water_value = value
	elif value_name == "shallow_water_value":
		shallow_water_value = value
	elif value_name == "sand_value":
		sand_land_value = value
	elif value_name == "grassland_value":
		grass_land_value = value
	elif value_name == "forest_value":
		forest_land_value = value
	elif value_name == "low_land_value":
		low_land_value = value
	elif value_name == "high_land_value":
		high_land_value = value
	elif value_name == "mountain_value":
		mountain_land_value = value
	elif value_name == "seed":
		noise_height_texture.noise.seed = value
		noise = noise_height_texture.noise
	elif value_name == "frequency":
		noise_height_texture.noise.frequency = value
		noise = noise_height_texture.noise
	elif value_name == "generate":
		generate_world()
