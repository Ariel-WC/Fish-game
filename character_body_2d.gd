extends CharacterBody2D

@onready var Tateixe = $Tateixe
const VH_speed = [50, 20]
var HVdir = [1, 1]
var HVpos = [0, 0]
var distance_to_travel_max = randi_range(700, 1250)
var distance_to_travel_min = randi_range(600, 700)
#var vertical_limit_min = 550
#var vertical_limit_max = 640 

#func define_position_max():
#	distance_to_travel_max = randi_range(700, 1250)

#func define_position_min():
#	distance_to_travel_min = randi_range(600, 700)

class Rullers:
	
	func vertical_limit_min():
		return randi_range(550, 500)
	
	func vertical_limit_max():
		return randi_range(600, 550)	
	
	func define_position_max():
		return randi_range(700, 1250)
		
	func define_position_min():
		return randi_range(600, 700)

func vertical_travel(delta, vertical_limit_max, vertical_limit_min):

	position.y += VH_speed[1] * HVdir[1] * delta
	HVpos[1] = position.y

	if (HVpos[1] > vertical_limit_max):
		print("AAAAAA: ", vertical_limit_min)
		HVdir[1] = -1
	elif (HVpos[1] < vertical_limit_min):
		print("AAAAAA: ", vertical_limit_max)
		HVdir[1] = 1


func _process(delta):
	var rullers = Rullers.new()
	HVpos[0] = position.x
	position.x += VH_speed[0] * HVdir[0] * delta
	vertical_travel(delta, rullers.vertical_limit_max(), rullers.vertical_limit_min())

	if (HVpos[0] > distance_to_travel_max):
		HVdir[0] = -1
		distance_to_travel_min = rullers.define_position_min()
		Tateixe.flip_h = true
		print(distance_to_travel_min)

	elif (HVpos[0] < distance_to_travel_min):
		HVdir[0] = 1
		distance_to_travel_max = rullers.define_position_max()
		Tateixe.flip_h = false
		print(distance_to_travel_min)


func _ready():
	print(distance_to_travel_max)
	print(distance_to_travel_min)
