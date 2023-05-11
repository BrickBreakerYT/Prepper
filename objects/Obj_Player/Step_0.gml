
//Locks player in place when throwing TNT
//See "Key Down - Space" and "Animation End"
//This step must be done before movement is calculated

	if !throwing{
	//Grabs Inputs
	MoveRight = keyboard_check(vk_right);
	MoveLeft = keyboard_check(vk_left);
	MoveUp = keyboard_check(vk_up);
	MoveDown = keyboard_check(vk_down);

	//Converts Inputs to velocity
	vx = lerp(vx, ((MoveRight - MoveLeft)* WalkSpeed) ,0.3)
	vy = lerp(vy, ((MoveDown - MoveUp)* WalkSpeed), 0.3)

	//Caps speed for holding 2 movement keys
	if abs(vx) + abs(vy) > WalkSpeed{
		if abs(vx) > abs(vy){
			vx = lerp(vx,0,0.35)
		}
		else{
			vy = lerp(vy,0,0.35)	
		}
	}

	//Calculates movement from velocity
	if (vx != 0 || vy != 0) {
			if !collision_point(x+vx,y,ObjCollison,true,true) {
			x += vx;
		}
			if !collision_point(x,y+vy,ObjCollison,true,true) {
			y += vy;
		}
	}

	//Pushes Player if in collision object
	if collision_point(x,y,ObjCollison,true,true) {
		x = preX
		y = preY
	}



	// Sets Sprite Animation and speed
	if abs(vx) + abs(vy) > 0.1 and HasTNT = false{
		sprite_index = SprPlrWalk
		
		image_speed = lerp(image_speed, ((abs(vx) + abs(vy))/WalkSpeed) * 4 , 0.3)
	}
	else{
		sprite_index = SprPlrIdle
		image_speed = lerp(image_speed, 0.75, 0.01)
	}

	if HasTNT = true and abs(vx) + abs(vy) > 0.1{
		sprite_index = SprPlrWalkTNT
		image_speed = lerp(image_speed, ((abs(vx) + abs(vy))/WalkSpeed) * 4 , 0.3)
	}
	
else if HasTNT = true{
		sprite_index = SprPlrIdleTNT
		image_speed = lerp(image_speed, 0.75, 0.01)
	}

	// Sets player facing direction
	if (MoveRight - MoveLeft) > 0.1 {
		image_xscale = lerp(image_xscale, -1 , 0.75)
	}
	else if (MoveRight - MoveLeft) < -0.1{
		image_xscale = lerp(image_xscale, 1 , 0.75)
	}
}

if throwing{
	image_speed = 1
	sprite_index = SprPlrThrowTNT
	
	x = preX
	y = preY
	
}
depth = -y

//Locks player in place when throwing TNT
	

//Grabs position
preX = x
preY = y

