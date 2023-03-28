/// @description Movement

vx = ((MoveRight - MoveLeft)* WalkSpeed)
vy = ((MoveDown - MoveUp)* WalkSpeed)

if (vx == 0 && vy == 0) {
	
}

if (vx != 0 || vy != 0) {
	x += vx;
	y += vy;
}