
if sprite_index = SprBkrCurl{
	if currentState = "Curl"{

		currentState = "Roll"
		sprite_index = SprBkrRoll
	}
}
	if sprite_index = SprBkrUnCurl{
		currentState = "Idle"
		stun = 60
		unCurling = false
}

if sprite_index = SprBkrFire{
	if currentState = "Curl"{
		sprite_index = SprBkrCurl
		image_speed = 1
	}
	else{
		sprite_index = SprBkrIdle	
	}
}