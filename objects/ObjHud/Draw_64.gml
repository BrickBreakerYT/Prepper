image_index = global.Player_Health
draw_sprite(SprHUD,global.Player_Health - 1,124,240)

if global.Player_Health <= 0 {
	game_restart()
}

draw_sprite(SprTNT2,0,250,200)