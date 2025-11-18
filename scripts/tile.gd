extends Node2D

@export var noise_height_texture : NoiseTexture2D
var noise : Noise

@onready var map_hexes: TileMapLayer = $MapHexes
var source_id = 0


var high_land_atlas = Vector2i(0,0)
var low_land_atlas = Vector2i(1,0)
var shallow_water_atlas = Vector2i(2,0)
var deep_water_atlas = Vector2i(3,0)
var grass_land_atlas = Vector2i(4,0)
var forest_atlas = Vector2i(5,0)
var sand_land_atlas = Vector2i(6,0)
var mountain_atlas = Vector2i(7,0)

var range_arr = [-0.2, 0.25, 0.3, 0.4, 0.6, 0.7, 0.8]

var width : int = 600
var height : int = 400

func _ready() -> void:
	noise = noise_height_texture.noise
	generate_world()
	
func generate_world():
	for x in range(width):
		for y in range(height):
			var noise_val = noise.get_noise_2d(x,y)
			if noise_val >= range_arr[1] and noise_val < range_arr[2]:
				map_hexes.set_cell(Vector2i(x,y), source_id, sand_land_atlas)
			elif noise_val >= range_arr[2] and noise_val < range_arr[3]:
				map_hexes.set_cell(Vector2i(x,y), source_id, grass_land_atlas)
			elif noise_val >= range_arr[3] and noise_val < range_arr[4]:
				map_hexes.set_cell(Vector2i(x,y), source_id, forest_atlas)
			elif noise_val >= range_arr[4] and noise_val < range_arr[5]:
				map_hexes.set_cell(Vector2i(x,y), source_id, low_land_atlas)
			elif noise_val >= range_arr[5] and noise_val < range_arr[6]:
				map_hexes.set_cell(Vector2i(x,y), source_id, high_land_atlas)
			elif noise_val >= range_arr[6]:
				map_hexes.set_cell(Vector2i(x,y), source_id, mountain_atlas)
			elif noise_val <= range_arr[1] and noise_val > range_arr[0]:
				map_hexes.set_cell(Vector2i(x,y), source_id, shallow_water_atlas)
			elif noise_val <= range_arr[0]:
				map_hexes.set_cell(Vector2i(x,y), source_id, deep_water_atlas)
