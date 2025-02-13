extends Stage

onready var _anim_player = $AnimationPlayer
onready var _little_girl = $LittleGirl
onready var _little_girl2 = $LittleGirl2
onready var _giant_guardian = $GiantGuardian
onready var _teleporter = $Teleporter
onready var _noticing_the_girl = $NoticingTheGirl
onready var _earthquake_starts = $EarthquakeStarts
onready var _where_are_we = $WhereAreWe
onready var _enemy_spotted = $EnemySpotted
onready var _top_path_earthquake = $TopPathEarthquake
onready var _guardian_chamber = $GuardianChamber
onready var _second_note_location = $Note2.get_global_position()
onready var _third_note_location = $Note3.get_global_position()


var _little_girl_path = "res://Character/LittleGirl.tscn"
var _objective_counter = 0

func _ready():
	_player.set_current_state("ON_CUTSCENE")
	_player.play_animation("Scared")
	yield(_player._anim_player, "animation_finished")
	_player.play_animation("Idle")
	_little_girl._anim_player.play("Sad")
	_ui.play_transition("in")
	_anim_player.play("FIrstTimeEnteringDream")


func _unhandled_key_input(event):
	if event.is_action_pressed("reload"):
		get_tree().reload_current_scene()


func _on_NoticingTheGirl_body_entered(body):
	body.set_current_state("ON_CUTSCENE")
	body.play_animation("Scared")
	yield(body._anim_player, "animation_finished")
	body.play_animation("Idle")
	_anim_player.play("NoticingTheGirlPt1")
	yield(_anim_player, "animation_finished")
	_dialog_box.append_text("Kyoko: This place is weird...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("???: *sobs*[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: I heard someone![break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_anim_player.play("NoticingTheGirlPt2")
	yield(_anim_player, "animation_finished")
	_dialog_box.append_text("Kyoko: Hello?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("???: ...*sobs*[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: Hmmm...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_anim_player.play("NoticingTheGirlPt3")
	yield(_anim_player, "animation_finished")
	body.set_current_state("IDLE")
	_noticing_the_girl.queue_free()


func _on_EarthquakeStarts_body_entered(body):
	body.set_current_state("ON_CUTSCENE")
	body._anim_player.play("Idle")
	_dialog_box.append_text("Kyoko: Hmmm... What a weird place. [break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: ?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: What's that weird thing there?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: Hmmm it might come in handy...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: !?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_anim_player.play("EarthquakeStarts")
	yield(_anim_player, "animation_finished")
	_dialog_box.append_text("Kyoko: Wh... What was that?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	body.set_current_state("IDLE")
	_earthquake_starts.queue_free()


func first_time_entering_dream():
	_player._anim_player.play("FirstTimeEnteringDream")


func _on_WhereAreWe_body_entered(body):
	body.set_current_state("ON_CUTSCENE")
	body._anim_player.play("Idle")
	body._camera.zoom.x = 0.75
	body._camera.zoom.y = 0.75
	var little_girl = load(_little_girl_path).instance()
	_where_are_we.add_child(little_girl)
	little_girl.set_global_position(Vector2(body.get_global_position().x + 60, body.get_global_position().y))
	little_girl.set_npc_direction(body.get_global_position())
	_dialog_box.append_text("Kyoko: By the way, where are we actually?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: Hm?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: I mean this place. This is must be a dream, right?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: ...Kyoko, you are idiot[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: Huh???[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: Does this place look like a dream to you?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: Well, it certainly doesn't look like reality to me[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: ...you know that-[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_anim_player.play("WhereAreWe-Earthquake")
	little_girl._anim_player.play("Shocked")
	yield(_anim_player, "animation_finished")
	_dialog_box.append_text("Kyoko: ...what was that?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	little_girl._anim_player.play("Sad")
	_dialog_box.append_text("Hikari: Kyoko, I'm scared[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: ..don't worry, it seems we're ok for now[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: Let's keep moving for now...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	body.set_current_state("IDLE")
	body._camera.zoom.x = 1
	body._camera.zoom.y = 1
	little_girl.queue_free()
	_where_are_we.queue_free()


func _on_EnemySpotted_body_entered(body):
	body.set_current_state("ON_CUTSCENE")
	body.play_animation("Scared")
	body.play_animation("Idle")
	var little_girl = load(_little_girl_path).instance()
	_enemy_spotted.add_child(little_girl)
	little_girl.set_global_position(_enemy_spotted.get_global_position())
	little_girl.set_npc_direction(body.get_global_position())
	_dialog_box.append_text("???: *RAAGGHHH*[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("???: *KWWAAKRRKKK*[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: What are those thing?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	little_girl._anim_player.play("Shocked")
	_dialog_box.append_text("Hikari: awwwa awwwaa awwwaa awwwa[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: Hey, you ok?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	little_girl._anim_player.play("Sad")
	_dialog_box.append_text("Hikari: Those, those are the monster that I told you before[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: Kyoko, be careful...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: Urgh, it seems that our only way is that way...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	little_girl._anim_player.play("Idle")
	_dialog_box.append_text("Hikari: ...I'll help you[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: !?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	little_girl._anim_player.play("Transform")
	yield(little_girl._anim_player, "animation_finished")
	body.play_animation("Happy")
	yield(body._anim_player, "animation_finished")
	body.play_animation("GetSword")
	yield(body._anim_player, "animation_finished")
	body.play_animation("WeaponUp")
	_dialog_box.append_text("Kyoko: Whoaa....[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: Now you can use me to defeat them[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	body.set_current_state("IDLE")
	body.play_animation("Idle")
	body.set_is_using_sword("True")
	little_girl.queue_free()
	_enemy_spotted.queue_free()


func _on_TopPathEarthquake_body_entered(body):
	body.set_current_state("ON_CUTSCENE")
	body._anim_player.play("Idle")
	body._camera.zoom.x = 0.75
	body._camera.zoom.y = 0.75
	var little_girl = load(_little_girl_path).instance()
	_top_path_earthquake.add_child(little_girl)
	little_girl.set_global_position(Vector2(body.get_global_position().x - 50, body.get_global_position().y))
	little_girl.set_npc_direction(body.get_global_position())
	little_girl.play_animation("Shocked")
	_anim_player.play("TopPathEarthquake")
	yield(_anim_player, "animation_finished")
	_dialog_box.append_text("Kyoko: It happened again[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	little_girl.play_animation("Sad")
	_dialog_box.append_text("Hikari: *sob*[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	body._appearance.scale.x = -1
	_dialog_box.append_text("Kyoko: Hey, don't worry it will be ok...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	body._appearance.scale.x = 1
	_dialog_box.append_text("Kyoko: (Somehow the shaking got bigger just now...)[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: (Whatever create this must be near)[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: ...Kyoko, I'm scared...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	body._appearance.scale.x = -1
	_dialog_box.append_text("Kyoko: It's okay. Don't worry.[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: *sob*[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	body.play_animation("Normal")
	_dialog_box.append_text("Kyoko: C'mon, things will be fine, okay[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: You still have your concert, right?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: ...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: Hey, since you want to do a concert, do you love singing?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: *sob*...yeah...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: Don't worry. I promise I'll bring you to your concert. [break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: So stay strong, ok? So you can sing happily[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: *sob*[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	little_girl.play_animation("Idle")
	_dialog_box.append_text("Hikari: Okay[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: Good girl~[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: I need to get our from this dream too[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: But Kyoko, this isn't-[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	little_girl.play_animation("Shocked")
	_anim_player.play("TopPathEarthquake")
	yield(_anim_player, "animation_finished")
	_dialog_box.append_text("Kyoko: (Again!?)[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: You okay? let's keep going, okay?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: ...Yeah...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	body._appearance.scale.x = 1
	body.set_current_state("IDLE")
	body._camera.zoom.x = 1
	body._camera.zoom.y = 1
	little_girl.queue_free()
	_top_path_earthquake.queue_free()


func _on_GuardianChamber_body_entered(body):
	body.set_current_state("ON_CUTSCENE")
	body.play_animation("Walk")
	_little_girl2._anim_player.play("Walk")
	_anim_player.play("GuardianChamberPt1")
	yield(_anim_player, "animation_finished")
	body.shake_screen(0.5)
	body.play_animation("Scared")
	yield(body._anim_player, "animation_finished")
	body.play_animation("Idle")
	_little_girl2._anim_player.play("Shocked")
	_dialog_box.append_text("???: RAAAAARGGGHHHHHH[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_anim_player.play("GuardianChamberPt2")
	yield(_anim_player, "animation_finished")
	_giant_guardian.play_animation("Angry")
	_dialog_box.append_text("???: Who dare to enter my playground without my permission???[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: HIIIIIIIIKKK[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: *chuckles*[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_anim_player.play("GuardianChamberPt3")
	yield(_anim_player, "animation_finished")
	_little_girl2.play_animation("Sad")
	_dialog_box.append_text("Hikari: *crying* ...Kyoko...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	body.play_animation("Walk")
	_anim_player.play("GuardianChamberPt4")
	yield(_anim_player, "animation_finished")
	body.play_animation("Idle")
	_dialog_box.append_text("Giovanni: Who do you thing you are, interupting me, Giovanni, the ruler of this land?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: My name is Kyoko, and this is Hikari.[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: We need to get out from here. She needs to-[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_giant_guardian.play_animation("Slam")
	yield(_giant_guardian._anim_player, "animation_finished")
	_player.shake_screen(0.8)
	_dialog_box.append_text("Giovanni: RAAAARRGGHHH[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Giovanni: I know you. You are Hikari, the one who failed at her first performance![break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: !?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: ...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_giant_guardian.play_animation("Laugh")
	_dialog_box.append_text("Giovanni: GWA HA HA HA[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Giovanni: Are you trying to run away again, like what you did in your first concert? GWA HA HA HA[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: ...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: (Hikari...)[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_giant_guardian.play_animation("Idle")
	_dialog_box.append_text("Giovanni: I don't understand why Mr. P create a concert for you, a scared little talentless girl...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_giant_guardian.play_animation("Laugh")
	_dialog_box.append_text("Giovanni: GWA HA HA HA[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	body.play_animation("Normal")
	_anim_player.play("GuardianChamberPt5")
	yield(_anim_player, "animation_finished")
	_dialog_box.append_text("Kyoko: That's enough![break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_giant_guardian.play_animation("Idle")
	body.play_animation("Idle")
	_dialog_box.append_text("Giovanni: Ho ho, how brave you, to order ME, out of all being..[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Giovanni: Or are you seriously think that these useless scared little girl worth something, HUH?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	# Angry animation
	_dialog_box.append_text("Kyoko: ...I've saw her lyrics...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: It's still pretty decent, but she does have what it takes, and I BELIEVE that![break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: (And somehow, those lyrics looks familiar...)[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: *sobs*...Ms. Kyoko...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_giant_guardian.play_animation("Laugh")
	_dialog_box.append_text("Giovanni: GWA HA HA[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Giovanni: Do you really think so, tho?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_player.play_animation("Angry")
	_dialog_box.append_text("Giovanni: GWA HA HA HA HA[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: ...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: (...tsk, is defeating him is the only way out here?)[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_little_girl2.play_animation("Idle")
	_anim_player.play("GuardianChamberPt6")
	yield(_anim_player, "animation_finished")
	_dialog_box.append_text("Hikari: ...No...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_giant_guardian.play_animation("Idle")
	_dialog_box.append_text("Giovanni: \"!?\"[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_anim_player.play("GuardianChamberPt7")
	yield(_anim_player, "animation_finished")
	_dialog_box.append_text("Hikari: I won't let you do that![break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_little_girl2.play_animation("Transform")
	yield(_little_girl2._anim_player, "animation_finished")
	_anim_player.play("GuardianChamberPt8")
	yield(_anim_player, "animation_finished")
	body.play_animation("Happy")
	yield(body._anim_player, "animation_finished")
	body.play_animation("GetSword")
	yield(body._anim_player, "animation_finished")
	_dialog_box.append_text("Kyoko: ...Hikari...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: I love singing...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: I want to do my concert...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	body.shake_screen(0.3)
	_dialog_box.append_text("Hikari: I WON'T LET YOU GET IN MY WAY!!![break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: (...nice one there...)[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_anim_player.play("GuardianChamberPt9")
	_dialog_box.append_text("Giovanni: ....[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_giant_guardian.play_animation("Angry")
	body.shake_screen(0.5)
	_dialog_box.append_text("Giovanni: ARGGHH[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_giant_guardian.play_animation("Slam")
	yield(_giant_guardian._anim_player, "animation_finished")
	body.shake_screen(0.5)
	_giant_guardian.play_animation("Slam")
	yield(_giant_guardian._anim_player, "animation_finished")
	_giant_guardian.play_animation("Slam")
	body.shake_screen(0.5)
	yield(_giant_guardian._anim_player, "animation_finished")
	body.shake_screen(0.8)
	_dialog_box.append_text("Giovanni: You really dare to challange ME!!![break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	body.play_animation("WeaponUp")
	_dialog_box.append_text("Kyoko and Hikari: YES![break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_giant_guardian.play_animation("Angry")
	body.shake_screen(0.8)
	_dialog_box.append_text("Giovanni: RARGGHH[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: ...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: ...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_giant_guardian.play_animation("Idle")
	_dialog_box.append_text("Giovanni: ...sigh...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_giant_guardian._appearance.scale.x = 1
	_dialog_box.append_text("Giovanni: The lever is up ahead[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko and Hikari: !?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Giovanni: I'm sure you two already know the way out[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Giovanni: Get off from my sight[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: ...ummm, just that?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_giant_guardian._appearance.scale.x = -1
	body.shake_screen(0.25)
	_dialog_box.append_text("Giovanni: HUH?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Giovanni: I have no time to spare to two idiots[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Giovanni: Just piss off before i changed my mind...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	body.play_animation("Idle")
	_little_girl2.play_animation("Idle")
	_anim_player.play("GuardianChamberPt10")
	_dialog_box.append_text("Kyoko: ...umm, alrite....[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_giant_guardian.play_animation("Walk")
	_anim_player.play("GuardianChamberPt11")
	yield(_anim_player, "animation_finished")
	_giant_guardian.play_animation("Idle")
	_dialog_box.append_text("Giovanni: LITTLE GIRL![break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_little_girl2.play_animation("Shocked")
	_dialog_box.append_text("Hikari: YES!?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Giovanni: If the same thing happen, I'll come to eat you alive...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	body.shake_screen(0.3)
	_dialog_box.append_text("Giovanni: GOT IT?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_little_girl2.play_animation("Idle")
	_dialog_box.append_text("Hikari: YES SIR![break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_anim_player.play("GuardianChamberPt12")
	yield(_anim_player, "animation_finished")
	_player.play_animation("Normal")
	_dialog_box.append_text("Kyoko: ...that was weird...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: ...phew...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: ...Kyoko...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_player._appearance.scale.x = -1
	_dialog_box.append_text("Kyoko: Hm?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: ...Thanks...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_player.play_animation("Normal")
	_dialog_box.append_text("Kyoko: *giggles*[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: You are stronger than you think. Remember that.[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: Ok[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_player._appearance.scale.x = 1
	_anim_player.play("GuardianChamberPt13")
	_dialog_box.append_text("Kyoko: Now let's get out from here...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_little_girl2.queue_free()
	body.set_current_state("IDLE")
	_guardian_chamber.queue_free()


func objective_collected(objective_name):
	_player.set_current_state("ON_CUTSCENE")
	_player._anim_player.play("Idle")
	_objective_counter += 1
	if _objective_counter == 3:
		_teleporter.set_can_teleport(true)
	if objective_name == "Note":
		first_note_found()
	elif objective_name == "Note2":
		second_note_found()
	elif objective_name == "Note3":
		third_note_found()


func first_note_found():
	_dialog_box.append_text("Kyoko: Hmmm, what's this?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: ...A note?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_player.play_animation("InteractWithObject")
	_dialog_box.append_text("Kyoko: ...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: ...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: It seems like some kind of poem or lyric[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: Whose note is this?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: ..Somehow it seems familiar...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_little_girl.set_found_first_note(true)
	_player.set_current_state("IDLE")
	_player.play_animation("Idle")


func second_note_found():
	var little_girl = load(_little_girl_path).instance()
	add_child(little_girl)
	little_girl.set_global_position(_second_note_location)
	little_girl.set_npc_direction(_player.get_global_position())
	_dialog_box.append_text("Kyoko: Hey look, another of your notes![break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: Ahh, yay![break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: !?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: ?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: I remember this place...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: There's a gate somhere inside. That's where i came from[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: !?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: Ah, i remember, i left one of my note there![break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: Ah, I see...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: Do you remember which way is it?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: Hmmm...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: Sorry, i forgot :v[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: Sigh...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: It's ok, we can wander around a bit...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_player.set_current_state("IDLE")
	little_girl.queue_free()


func third_note_found():
	var little_girl = load(_little_girl_path).instance()
	add_child(little_girl)
	little_girl.set_global_position(_third_note_location)
	little_girl.set_npc_direction(_player.get_global_position())
	_dialog_box.append_text("Hikari: There you are![break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: Phew...[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: !?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: Hey, what's that?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: Hmm?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: Owh, that's weird.[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: The last time I'm here, these gate was open[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: Is this where you come from?[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: Yeah[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: Hmm, there's must a way to open it somewhere [break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Kyoko: Let's find it together [break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_dialog_box.append_text("Hikari: Okay~[break]", 100)
	yield(_dialog_box, "break_ended")
	_dialog_box.hide_box()
	_player.set_current_state("IDLE")
	little_girl.queue_free()
