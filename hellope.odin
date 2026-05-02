package main

import rl "vendor:raylib"
import "core:fmt"

SCREEN_WIDTH 	:: 800
SCREEN_HEIGHT 	:: 600


GameState :: enum {
	MENU,
	GAMEPLAY,
}

PlayerType :: enum {
	ENEMY,
	PLAYER,
}

Entity :: struct {
	pos: rl.Vector2
}


UpdateEntity :: proc(dt: f32) {
	
}

MakeEntity :: proc() {

}

DrawEntity :: proc(item: ^Entity) {

}


main :: proc() {
	rl.InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Test")

	defer {
		rl.CloseWindow()
	}

	rl.SetTargetFPS(120)

	for !rl.WindowShouldClose() {
		rl.BeginDrawing()
		rl.DrawText(fmt.ctprint("fps: ", rl.GetFPS()), 10, 10, 10, rl.RAYWHITE)
		rl.ClearBackground(rl.BLACK)
		rl.EndDrawing()
	}

}
