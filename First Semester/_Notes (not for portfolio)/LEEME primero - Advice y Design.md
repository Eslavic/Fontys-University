# Léeme primero: Advice y Design (23 sept)

Tres archivos para tu vault, más esta nota (esta no va al portfolio):

| Archivo | Dónde va | Qué hacer |
|---|---|---|
| `Advice - engine and AI choice.md` | `LO2 .../Challenge 1 - The Witness/2 Advice/` | **Sustituye** el que tienes (ahora solo tiene el comentario de 44 palabras) |
| `Design.md` | `LO2 .../Challenge 1 - The Witness/3 Design/` | **Sustituye** el que tienes (ahora está vacío, 0 bytes) |
| `Level layout sketch.svg` | `LO2 .../Challenge 1 - The Witness/3 Design/` | Nuevo. El Design lo enseña con `![[Level layout sketch.svg]]` |

Uso los mismos nombres de archivo que ya tenías para que el enlace `[[Design]]` del Analysis siga funcionando.

---

## 1. La diferencia entre Advice y Design, en una frase

- **Advice** = *qué opciones había y por qué elegí esta*. Comparas Godot, Unity, GameMaker y Pygame, y dices cuál recomiendas.
- **Design** = *ahora que he elegido, cómo lo construyo*. El árbol de nodos, los diagramas, el diseño de The Hunter.

Por eso la comparación de motores **no** va en el Design: si la metes ahí, la fase Advice se queda vacía y el rubric te baja LO2.

## 2. Qué es tuyo y qué es nuevo

**Tuyo, solo reordenado:** la comparación de motores (Godot vs Unity vs GameMaker vs Pygame), lo de GDScript parecido a Python, la estética noir de tres colores, el diseño de The Hunter (cuadrícula, 4 movimientos, las 4 recompensas), el flowchart de draw.io, los sprites de Blender en 8 direcciones.

**Nuevo, que tienes que entender antes de defenderlo delante de Frank:**

1. **Comparar también la IA (Advice, sección 4).** Además del motor, comparo cuatro formas de mover a los enemigos: reglas fijas (state machine), pathfinding, Q-learning con tabla y deep learning. Conclusión: los guardias con reglas fijas (son predecibles a propósito, son "el grupo de control"), The Hunter con Q-learning con tabla.
2. **Las paredes en el estado de The Hunter (Design 6.2).** Tu diseño original castigaba chocar con paredes, pero The Hunter solo sabía dirección y distancia al jugador. Problema: *no puede aprender a evitar algo que no ve*. Así que le añadí cuatro "sensores": ¿hay pared arriba, abajo, izquierda, derecha? Si Frank te pregunta, esa es la frase.
3. **Los números de Q-learning (6.4 y 6.5).** Las recompensas (+50, +1, −1, −5) y los ajustes (learning rate 0.1, discount 0.9, exploración de 1.0 a 0.05) son un punto de partida razonable, no algo que tú hayas probado. Está marcado con un `%% TO DO %%` para que lo sepas.
4. **Cómo se mide (6.7).** 50 intentos con un Hunter sin entrenar, entrenas 500 intentos, repites los 50 con el entrenado y comparas cuántos movimientos necesita para atraparte. Es lo que el cliente pregunta. Los números 50/500/10 son estimaciones mías: pregunta a Frank si le parecen bien.

### Q-learning en 30 segundos, por si Frank pregunta

Imagina una hoja de Excel. Cada fila es una situación ("el jugador está al noreste, lejos, y tengo pared a la izquierda"). Cada columna es un movimiento (arriba, abajo, izquierda, derecha). Al principio todo vale 0. Cada vez que The Hunter se mueve, recibe puntos (+1 si se acerca, −1 si se aleja, +50 si te pilla) y sube o baja un poco el número de esa casilla. Después de muchos intentos, en cada situación elige el movimiento con el número más alto. Eso es todo. La tabla tiene 384 filas × 4 columnas = 1.536 números.

## 3. Cosas que tienes que hacer tú (15 minutos)

1. **Flowchart:** quita la rama "Continue / Load Game" del draw.io. En el Analysis (3.2) dices que guardar partida está fuera del alcance, y Frank lo va a ver.
2. **Lee los tres `%% TO DO %%`** del Design (son comentarios de Obsidian, no salen en el PDF).
3. **Cámbialo a tu voz** donde no suene a ti. Sobre todo la sección 3.2 del Advice ("After watching two Pygame tutorials I dropped it"): ¿fue así de verdad? Si no, cámbialo a lo que pasó.

## 4. Importante para el prototipo de hoy: la escala

Esto lo he visto al leer tu proyecto de Godot. Tu jugador mide unas **425 unidades** de ancho (sprite de 1024 y círculo de colisión de radio 212), con la cámara a zoom 0.3. Pero la guía del enemigo que te pasé usaba números pensados para un mundo pequeño: un enemigo de 24 × 24 y un cono de 140. Al lado de tu jugador serían **del tamaño de un punto**.

Usa estos números en su lugar (están también en el Design, sección 2.3):

| En la guía ponía | Pon esto |
|---|---|
| ColorRect 24 × 24, offset −12 | 360 × 360, offset −180 |
| RectangleShape2D 24 × 24 | 360 × 360 |
| CircleShape2D del CatchArea, radio 16 | radio 200 |
| `patrol_speed` 45 | 150 |
| `chase_speed` 90 | 300 |
| `arrive_distance` 6 | 30 |
| Paredes | 100 de grosor |

Y los puntos del cono (`Vision/CollisionPolygon2D` → `Polygon`), 90 grados y 1800 de largo:

```
(0, 0)  (1273, -1273)  (1663, -689)  (1800, 0)  (1663, 689)  (1273, 1273)
```

Otra cosa que vi: tu `Camera2D` está como **hermana** del Player en `game_the_witness.tscn`, no como hija. Así no te sigue. Arrástrala dentro del nodo Player (y ponle position 0, 0). El nivel del sketch mide 7200 × 3600 y la pantalla a zoom 0.3 ve unas 3840 × 2160, así que la cámara tiene que seguirte.
