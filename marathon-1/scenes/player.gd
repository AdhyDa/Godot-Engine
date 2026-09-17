extends CharacterBody2D

var speed = 150.0 
const JUMP_VELOCITY = -300.0

# 1 Kotak Grid = 16 pixel, maka 5 kotak = 80 pixel
const TILE_SIZE = 16.0
const MIN_FALL_DIST = 5.0 * TILE_SIZE # 80.0 pixel

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var is_dying: bool = false
var fall_start_y: float = 0.0
var was_on_floor: bool = true

func _ready() -> void:
	add_to_group("player")

func _physics_process(delta: float) -> void:
	if is_dying:
		return

	# 1. Menangani Gravitasi
	if not is_on_floor():
		velocity += get_gravity() * delta

	# 2. DETEKSI AWAL JATUH
	# Jika frame sebelumnya masih di lantai dan frame sekarang mulai melayang/jatuh
	if was_on_floor and not is_on_floor():
		fall_start_y = global_position.y # Catat posisi Y awal melayang

	# 3. DETEKSI MENDARAT DI LANTAI
	# Jika frame sebelumnya melayang dan frame sekarang menyentuh lantai
	if not was_on_floor and is_on_floor():
		var fall_distance = global_position.y - fall_start_y
		
		# Jika jarak jatuh >= 5 kotak (80 pixel), pemicu animasi death
		if fall_distance >= MIN_FALL_DIST:
			trigger_fall_and_respawn()
			was_on_floor = is_on_floor()
			return

	# Simpan status lantai untuk diperiksa pada frame berikutnya
	was_on_floor = is_on_floor()

	# 4. Menangani Lompatan
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# 5. Pergerakan Horizontal & Flip
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true

	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	# 6. Pemutaran Animasi
	update_animation(direction)

	move_and_slide()

func update_animation(direction: float) -> void:
	if not is_on_floor():
		animated_sprite.play("jump")
	elif direction != 0:
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")

func trigger_fall_and_respawn() -> void:
	is_dying = true
	velocity = Vector2.ZERO
	animated_sprite.play("death")
	
	# Tunggu hingga animasi death selesai dimainkan
	await animated_sprite.animation_finished
	
	# Tunggu sebentar (1 detik) sebelum avatar berdiri kembali
	await get_tree().create_timer(5.0).timeout
	
	is_dying = false
	animated_sprite.play("idle")
