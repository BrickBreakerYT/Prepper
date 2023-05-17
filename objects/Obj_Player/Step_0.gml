
//Locks player in place when throwing TNT
//See "Key Down - Space" and "Animation End"
//This step must be done before movement is calculated





if !throwing && !Flung{
	//Grabs Inputs
		MoveRight = keyboard_check(vk_right);
		MoveLeft = keyboard_check(vk_left);
		MoveUp = keyboard_check(vk_up);
		MoveDown = keyboard_check(vk_down);
		
		//Calculates Camera Position
		camXoffset = (MoveRight - MoveLeft)*50
		camYoffset = (MoveDown - MoveUp)* 50

		if (MoveRight - MoveLeft) = 0 {camXoffset = -image_xscale * 50}
		
		camX = lerp(camX, (x + camXoffset) -160, 0.07)
		camY = lerp(camY, y + camYoffset - 120, 0.07)
		
		camera_set_view_pos(view_camera[0], camX, camY)

		if camX >= room_width - 340 {camX = room_width - 340}
		if camX <= 40 {camX = 40}
		if camY >= room_height - 280 {camY = room_height - 280}
		if camY <= 40 {camY = 40}

		
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

	// Sets Sprite Animation and speed
	if abs(vx) + abs(vy) > 0.1 and ammoCount <= 0{
		sprite_index = SprPlrWalk
		
		image_speed = lerp(image_speed, ((abs(vx) + abs(vy))/WalkSpeed) * 4 , 0.3)
	}
	else{
		sprite_index = SprPlrIdle
		image_speed = lerp(image_speed, 0.75, 0.01)
	}

	if ammoCount >= 1 and abs(vx) + abs(vy) > 0.1{
		sprite_index = SprPlrWalkTNT
		image_speed = lerp(image_speed, ((abs(vx) + abs(vy))/WalkSpeed) * 4 , 0.3)
	}
	
	else if ammoCount >= 1{
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


	//Pushes Player if in collision object
if collision_point(x,y,ObjCollison,true,true) {
		x = preX
		y = preY
		if ammoCount >=1{sprite_index = SprPlrIdleTNT}
		else{sprite_index = SprPlrIdle}
		if Flung{
			global.Player_Health -= speed/2
			speed = 0
			Flung = false 
		
		}
		
}


if throwing{
image_speed = 1
sprite_index = SprPlrThrowTNT
	
x = preX
y = preY
	
if image_index >= 9 and !TNTthrown{
	var TNT = instance_create_layer(x,y, "Instances",ObjTNT)
	TNT.xVel = -image_xscale * 3
	TNTthrown = true
}
}
depth = -y

iframes -= 1


//Grabs position
preX = x
preY = y


if Flung{
	speed -= 0.1
	sprite_index = SprPlrFlung
	
	image_xscale = (hspeed/10)
	
	if image_xscale < 0 && image_xscale > -1 {image_xscale = -1}
	if image_xscale > 0 && image_xscale < 1 {image_xscale = 1}
	
	
	if speed <= 0.1{
		 Flung = false
		 speed = 0
	}
}
