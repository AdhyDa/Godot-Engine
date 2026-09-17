extends Area2D

func _ready() -> void:
	# Menghubungkan sinyal tabrakan secara otomatis
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	# Memeriksa apakah yang menyentuh titik finish adalah player
	if body.is_in_group("player") or body.name == "player":
		var game = get_tree().current_scene
		
		# Menghapus objek finish ini dari permainan
		queue_free()
