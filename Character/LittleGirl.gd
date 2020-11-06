extends Npc

onready var _anim_player = $AnimationPlayer


func chat(source_position, dialog_box):
	set_npc_direction(source_position)
	dialog_box.append_text("hey[break]", 100)
	yield(dialog_box, "break_ended")
	dialog_box.hide_box()
	.chat(source_position, dialog_box)
	
