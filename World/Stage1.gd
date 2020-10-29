extends Stage

onready var _player = $Player


func _ready():
	_player.set_current_state("ON_CUTSCENE")
