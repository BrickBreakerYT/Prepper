if sprite_index = SprBkrFire{
	if currentState = "Curl"{
		sprite_index = SprBkrCurl
		image_speed = 1
	}
	else{
		sprite_index = SprBkrIdle	
	}
}

if sprite_index = SprBkrCurl{
	if currentState = "Curl"{
		show_debug_message("Here")
		currentState = "Roll"
		sprite_index = SprBkrRoll
	}
	if currentState = "UnCurl"{
		currentState = "Idle"
		stun = 60
	}
}