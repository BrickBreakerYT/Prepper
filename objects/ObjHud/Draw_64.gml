image_index = global.Player_Health
draw_sprite(SprHUD,global.Player_Health - 1,124,240)

if global.Player_Health <= 0 {
	game_restart()
}

draw_sprite(SprTNT2,0,250,200)
draw_set_font(Font1)
draw_text(250,200,"x"+string(Obj_Player.ammoCount))