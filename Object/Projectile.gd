extends RigidBody2D


func _on_Projectile_body_entered(body):
	queue_free()
