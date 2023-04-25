



if object_exists(Obj_Player){
	playerX = Obj_Player.x
	playerY = Obj_Player.y
	distToPlayer = abs(x - playerX) + abs(y - playerY)
}




if currentState = "Asleep" {
	if distToPlayer <= wakeupRange{
		currentState = "WakeUp"
	}
	sprite_index =  SprBkrWake
	image_speed = 0
}
else{
	if playerX > x{
	facingDirection = lerp(facingDirection, 1, 0.5)
	}
	else{
		facingDirection = lerp(facingDirection, -1, 0.5)
	}
	
	image_xscale = facingDirection
}



//Being awakened by player
if currentState = "WakeUp"{
	image_speed = 1
	if image_index >= 3.5{
		currentState = "Idle"
	}
}

//Idle before firing
if currentState = "Idle"{
	sprite_index = SprBkrIdle
	if idleCountdown >= 0{
		idleCountdown -= 1
	}
	else{
		idleCountdown = 30
		currentState = "Firing"
	}
}

depth = -y