	# Prototipo jugable: enemigo, cono de visión y game over

Esto es lo que te pidió Farouk: cajas rojas como enemigos, un cono de visión, y
si te tocan mueres. Sin arte, sin animaciones.

**Aviso importante:** yo no puedo abrir Godot desde aquí, así que este código no
está probado. Lo he escrito con cuidado y para Godot 4, pero lo vas a tener que
montar y ejecutar tú. Si algo peta, pégame el error y lo arreglamos. Es normal
que haga falta una o dos vueltas.

Calcula una hora, hora y media la primera vez.

---

## Antes de empezar: dos cosas de un minuto

**1. Quita el `print` del jugador.** En `player_character.gd` tienes esta línea:

```gdscript
print(state, " - Speed: ", current_speed)
```

Se ejecuta 60 veces por segundo. Bórrala antes de grabar cualquier vídeo.

**2. Mete al jugador en un grupo.** Selecciona el nodo raíz de
`player_character.tscn`, pestaña **Node → Groups**, y añade un grupo llamado
`player`. El enemigo lo usa para saber a quién persigue.

---

## Paso 1: las capas de colisión

En **Project → Project Settings → Layer Names → 2D Physics**, ponles nombre a
las tres primeras:

| Capa | Nombre |
|:----:|--------|
| 1 | `world` |
| 2 | `player` |
| 3 | `enemy` |

Esto no es decoración: sin nombres te vas a perder en cuanto haya tres nodos con
máscaras distintas.

Luego, en cada nodo:

- **Jugador** → Layer: `player`. Mask: `world`.
- **Paredes** (StaticBody2D) → Layer: `world`. Mask: vacío.
- **Enemigo** → Layer: `enemy`. Mask: `world`.

---

## Paso 2: el mapa

No necesitas un TileMap todavía. Con esto vale:

1. En `game_the_witness.tscn`, añade un `Node2D` y llámalo `Walls`.
2. Dentro, añade varios `StaticBody2D`. A cada uno: un `CollisionShape2D` con un
   `RectangleShape2D`, y un `ColorRect` para verlo.
3. Colócalos formando una sala con un par de obstáculos en medio. Cuatro o cinco
   paredes son suficientes.

Los obstáculos importan: sin nada que bloquee la vista, el cono de visión no se
nota y la demo no enseña nada.

---

## Paso 3: la escena del enemigo

Escena nueva, nodo raíz `CharacterBody2D`, llámalo `Enemy`. Guárdala como
`Scenes/enemy.tscn`. Dentro necesitas exactamente estos hijos:

```
Enemy  (CharacterBody2D)
├── ColorRect          ← el cuadrado rojo
├── CollisionShape2D   ← su cuerpo
├── Vision             (Area2D)
│   └── CollisionPolygon2D   ← el cono
├── CatchArea          (Area2D)
│   └── CollisionShape2D     ← un círculo pequeño
└── SightLine          (RayCast2D)
```

**El `ColorRect`:** tamaño 24×24, color rojo, y en Layout ponle offset −12 en X
e Y para que quede centrado.

**El `CollisionShape2D` del enemigo:** un `RectangleShape2D` de 24×24.

**El cono (`Vision/CollisionPolygon2D`):** en el inspector, en `Polygon`, mete
estos seis puntos a mano:

```
(0, 0)  (70, -121)  (121, -70)  (140, 0)  (121, 70)  (70, 121)
```

Eso te da un cono de unos 120 grados y 140 píxeles de alcance, apuntando hacia
la derecha. Hacia la derecha es lo correcto: en Godot, rotación 0 mira hacia +X,
y el script hace girar al enemigo hacia donde camina, así que el cono gira con
él.

**Máscaras de los tres nodos nuevos:**

- `Vision` → Layer: vacío. Mask: `player`.
- `CatchArea` → Layer: vacío. Mask: `player`. Su `CollisionShape2D` es un
  `CircleShape2D` de radio 16.
- `SightLine` → Mask: `world` **y** `player`. Marca **Enabled**.

El `SightLine` necesita ver las dos cosas: la pared para saber que estorba, y al
jugador para saber que no.

---

## Paso 4: el script del enemigo

Script nuevo en `Scripts/enemy.gd`, y lo enchufas al nodo `Enemy`:

```gdscript
extends CharacterBody2D

## An enemy that walks a fixed route and chases the player when it sees them.
## Placeholder art is enough here: a red rectangle does the job.

enum State { PATROL, CHASE, CAUGHT }

## Drag the PatrolRoute node here. Its Marker2D children are the waypoints.
@export var patrol_route: Node2D
@export_range(0, 400) var patrol_speed: float = 45.0
@export_range(0, 400) var chase_speed: float = 90.0
## How fast the enemy turns towards where it is walking, in radians per second.
@export var turn_speed: float = 5.0
## How close to a waypoint counts as having arrived.
@export var arrive_distance: float = 6.0

@onready var vision: Area2D = $Vision
@onready var catch_area: Area2D = $CatchArea
@onready var sight_line: RayCast2D = $SightLine

var state: State = State.PATROL
var waypoints: Array[Node2D] = []
var current_waypoint: int = 0
var player_in_cone: Node2D = null

func _ready() -> void:
	if patrol_route:
		for child in patrol_route.get_children():
			if child is Node2D:
				waypoints.append(child)

	vision.body_entered.connect(_on_vision_body_entered)
	vision.body_exited.connect(_on_vision_body_exited)
	catch_area.body_entered.connect(_on_catch_area_body_entered)

func _physics_process(delta: float) -> void:
	_update_state()

	match state:
		State.PATROL:
			_walk_the_route(delta)
		State.CHASE:
			_walk_towards(player_in_cone.global_position, chase_speed, delta)
		State.CAUGHT:
			velocity = Vector2.ZERO

	move_and_slide()

## Decides which state the enemy is in this frame.
func _update_state() -> void:
	if state == State.CAUGHT:
		return

	if _can_see_player():
		state = State.CHASE
	else:
		state = State.PATROL

## The cone only tells us the player is within range and angle.
## This also checks that no wall sits between the two of them.
func _can_see_player() -> bool:
	if player_in_cone == null:
		return false

	sight_line.target_position = sight_line.to_local(player_in_cone.global_position)
	sight_line.force_raycast_update()

	if not sight_line.is_colliding():
		return true
	return sight_line.get_collider() == player_in_cone

func _walk_the_route(delta: float) -> void:
	if waypoints.is_empty():
		velocity = Vector2.ZERO
		return

	var target: Vector2 = waypoints[current_waypoint].global_position

	if global_position.distance_to(target) < arrive_distance:
		current_waypoint = (current_waypoint + 1) % waypoints.size()
		return

	_walk_towards(target, patrol_speed, delta)

func _walk_towards(target: Vector2, speed: float, delta: float) -> void:
	var direction: Vector2 = global_position.direction_to(target)
	velocity = direction * speed
	# Turn towards where we are going, so the vision cone follows.
	rotation = lerp_angle(rotation, direction.angle(), turn_speed * delta)

func _on_vision_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_cone = body

func _on_vision_body_exited(body: Node2D) -> void:
	if body == player_in_cone:
		player_in_cone = null

func _on_catch_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		state = State.CAUGHT
		GameManager.catch_player()
```

Fíjate en el `match` del `_physics_process`. Eso es lo que te pidió Farouk, y
aquí sí es el sitio correcto: hay **un** valor (`state`) con tres opciones. Por
eso funciona bien aquí y por eso no funcionaba en el `if is_crouching / elif
shift` del jugador, donde son dos booleanos distintos.

---

## Paso 5: la ruta de patrulla

En `game_the_witness.tscn`:

1. Añade un `Node2D` llamado `PatrolRoute`.
2. Dentro, tres o cuatro `Marker2D`. Colócalos por la sala formando un recorrido.
3. Arrastra la escena `enemy.tscn` a la escena del juego.
4. Selecciona el enemigo y, en el inspector, en **Patrol Route**, arrastra el
   nodo `PatrolRoute`.

Importante: `PatrolRoute` va suelto en la escena, **no** como hijo del enemigo.
Si fuera hijo suyo, los puntos se moverían con él y nunca llegaría a ninguno.

---

## Paso 6: el game over

Script nuevo en `Scripts/game_manager.gd`:

```gdscript
extends Node

## Autoload. Register it in Project > Project Settings > Globals
## with the name GameManager.

signal player_caught

var is_game_over: bool = false

func catch_player() -> void:
	if is_game_over:
		return
	is_game_over = true
	player_caught.emit()
	get_tree().paused = true

func restart() -> void:
	is_game_over = false
	get_tree().paused = false
	get_tree().reload_current_scene()
```

Ahora regístralo: **Project → Project Settings → Globals**, seleccionas
`res://Scripts/game_manager.gd`, nombre `GameManager`, y Add. Este paso es fácil
de olvidar, y si lo olvidas el juego peta al tocarte el enemigo.

Luego, en la escena del juego, un `CanvasLayer` llamado `GameOverScreen` con un
`ColorRect` oscuro que cubra la pantalla y un `Label` que ponga
`ATRAPADO — pulsa Enter`. Y este script:

```gdscript
extends CanvasLayer

func _ready() -> void:
	hide()
	# Keeps working while the rest of the game is paused.
	process_mode = Node.PROCESS_MODE_ALWAYS
	GameManager.player_caught.connect(_on_player_caught)

func _on_player_caught() -> void:
	show()

func _unhandled_input(event: InputEvent) -> void:
	if visible and event.is_action_pressed("ui_accept"):
		GameManager.restart()
```

---

## Cómo saber que va bien

Ejecuta la escena y comprueba estas cuatro cosas, en este orden:

1. El enemigo recorre los puntos en bucle y gira hacia donde camina.
2. Si te metes en el cono, acelera y va a por ti.
3. Si te escondes detrás de una pared estando dentro del cono, **deja de verte**.
   Esta es la que de verdad demuestra que el cono funciona.
4. Si te toca, se para todo y sale la pantalla de game over. Enter reinicia.

Si la 3 no funciona, casi seguro es la máscara del `SightLine`: tiene que tener
marcadas `world` y `player`, las dos.

---

## Dos cosas para después, no ahora

- Cuando le pongas sprites de verdad al enemigo, no querrás que el sprite gire.
  Entonces sacas el `ColorRect` fuera de la rotación y dejas girando solo el
  `Vision`. Hoy no: hoy que gire todo, que así se ve hacia dónde mira.
- El estado `CHASE` vuelve a `PATROL` en cuanto te pierde de vista. Un estado
  `SEARCH`, que vaya al último sitio donde te vio, queda mejor, pero es un
  añadido, no una necesidad. Está en tu MoSCoW como *Should Have*, así que
  déjalo para si sobra tiempo.

---

## Y esto es evidencia, no solo código

Mientras lo montas, haz dos capturas: una del árbol de nodos del enemigo y otra
del cono dibujado en el editor. Con eso y un vídeo corto de los cuatro puntos de
arriba tienes la evidencia de **Realise** casi hecha.

Y cuando termines, haz un commit con un mensaje de verdad, tipo
`Add patrolling enemy with vision cone and game over`. No cuesta nada y es lo que
te falta en el historial.
