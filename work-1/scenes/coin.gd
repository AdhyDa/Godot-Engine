extends Area2D

func _ready() -> void:
	# Menghubungkan sinyal tabrakan secara otomatis
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	# Memeriksa apakah yang menyentuh titik finish adalah player
	if body.is_in_group("player") or body.name == "player":
		var game = get_tree().current_scene
		
		# Mengambil node win_screen dari scene utama
		if game.has_node("win_screen"):
			var win_screen = game.get_node("win_screen")
			win_screen.start_countdown()
		
		# Menghapus objek finish ini dari permainan
		queue_free()
