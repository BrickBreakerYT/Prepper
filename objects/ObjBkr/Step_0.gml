



if object_exists(Obj_Player){
	playerX = Obj_Player.x
	playerY = Obj_Player.y
	distToPlayer = abs(x - playerX) + abs(y - playerY)
}




if currentState == "Asleep" {
	if distToPlayer <= wakeupRange{
		currentState = "WakeUp"
	}
	sprite_index =  SprBkrWake
	image_speed = 0
}
else if  currentState != "Roll" && currentState != "Curl" && currentState != "UnCurl"{
	if playerX > x{
	facingDirection = lerp(facingDirection, 1, 0.5)
	}
	else{
		facingDirection = lerp(facingDirection, -1, 0.5)
	}
	
	image_xscale = facingDirection
}



//Being awakened by player
if currentState == "WakeUp"{
	image_speed = 1
	if image_index >= 3.5{
		currentState = "Idle"
	}
}

//Idle before firing
if currentState == "Idle"{
	image_speed = 1
	sprite_index = SprBkrIdle
	if idleCountdown >= 0{
		idleCountdown -= 1
	}
	else{
		idleCountdown = 30
		currentState = "Firing"
	}
	if distToPlayer > SleepRange{
		sprite_index = SprBkrWake
		image_index = 4
		image_speed = -1
		currentState = "PowerDown"	
	}
}

if currentState == "Firing"{
		if shotsFired >= burstSize{
			currentState = "Curl"
			shotsFired = 0
			image_speed = 1
		}
		else{
			if fireDelay > 0{
				fireDelay -=1
			}
			else{
				fireDelay = 20
				instance_create_layer(x + (28*facingDirection), y - 26, "Instances", ObjBkrBullet)
				shotsFired += 1
				sprite_index = SprBkrFire
			}
		}
	}

if currentState == "Roll"{
	if rolling == false{
		direction = point_direction(x,y,Obj_Player.x,Obj_Player.y - 15)
		speed = 2
		rolling = true
	}
	else{
		var angleToPlayer
        angleToPlayer = point_direction(x,y,Obj_Player.x,Obj_Player.y - 15)
		var turnSpeed = 1.5
		
		if angle_difference(direction, angleToPlayer) > 0{direction -= turnSpeed}
		if angle_difference(direction, angleToPlayer) < 0{direction += turnSpeed}
		if abs(angle_difference(direction, angleToPlayer)) > 90{speed = lerp(speed, 0, 0.1)}
		else{speed = lerp(speed, 5, 0.1)}
	}
	if speed <= 0.5 && currentState = "Roll"{
		currentState = "UnCurl"
		speed = 0
		rolling = false
	}
}


if currentState == "UnCurl"{
	if stun > 0{
		speed = lerp(speed,0,0.25)
		image_speed = 0
		stun -= 1
	}
	else{
		sprite_index = SprBkrUnCurl
		image_speed = 1
		if unCurling = false{
			image_index = 0
			unCurling = true
		}
	}
}

if currentState == "PowerDown" && image_index >= 1{
	image_speed = 0
	currentState = "Asleep"
}


//Death
if dead{
	instance_create_layer(x,y,"Instances",ObjGib)
	instance_create_layer(x,y,"Instances",ObjGib)
	instance_create_layer(x,y,"Instances",ObjGib)
	instance_create_layer(x,y,"Instances",ObjGib)
	instance_create_layer(x,y,"Instances",ObjGib)
	instance_create_layer(x,y,"Instances",ObjGib)
	instance_destroy(self)
}




depth = -y

