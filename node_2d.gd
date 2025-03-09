extends Node2D
var stamina:int = 100
var fish_war:bool


func tipo_peixe():
	var gerar_peixe = randi_range(1, 100) 
	if gerar_peixe <= 60:
		print("Peixe comum")
	elif gerar_peixe > 60 && gerar_peixe < 90: 
		print("Peixe raro")
	else:
		print("Peixe lendário")

func _ready():
	tipo_peixe()
