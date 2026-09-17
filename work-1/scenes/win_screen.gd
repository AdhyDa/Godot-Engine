extends Control

func start_countdown() -> void:
	# Menampilkan UI Win Screen
	visible = true

	# Pause jalannya permainan
	get_tree().paused = true

	# Tunggu selama 5 detik
	await get_tree().create_timer(5.0, true, false, true).timeout

	# Keluar dari game
	get_tree().quit()
