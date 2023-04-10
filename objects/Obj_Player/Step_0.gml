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

