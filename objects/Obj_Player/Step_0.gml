MoveRight = keyboard_check(vk_right);
MoveLeft = keyboard_check(vk_left);
MoveUp = keyboard_check(vk_up);
MoveDown = keyboard_check(vk_down);


vx = ((MoveRight - MoveLeft)* WalkSpeed)
vy = ((MoveDown - MoveUp)* WalkSpeed)


if (vx == 0 && vy == 0) {
	
}

if (vx != 0 || vy != 0) {
	x += vx;
	y += vy;
}

if (vx != 0 || vy != 0) {
	if !collision_point(x+vx,y,ObjCollison,true,true) {
		x += vx;
	}
	
	if !collision_point(x,y+vy,ObjCollison,true,true) {
		y += vy;
	}
}