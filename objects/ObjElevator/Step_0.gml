playerX = Obj_Player.x
playerY = Obj_Player.y

PlrDist = abs(x - playerX) + abs(y - playerY)
if PlrDist >= range1{
	image_index = 0	
}
else if PlrDist >= range2{
	image_index = 1
}
else if PlrDist >= range3{
	image_index = 2
}
else if PlrDist >= range4{
	image_index = 3
}
else if PlrDist <= range4{
	room_goto_next()	
}

