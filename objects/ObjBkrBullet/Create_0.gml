if object_exists(Obj_Player){
	image_angle = point_direction(x,y,Obj_Player.x,Obj_Player.y - 15)
	direction = image_angle
}


speed = 4
image_speed = 0

image_angle += random_range(-5,5)