if currentState = "Roll"{
	other.direction = direction
	other.speed = speed*1.5
	other.Flung = true
	
	currentState = "UnCurl"
	speed = 0
	rolling = false
	Obj_Player.iframes = 5
	global.Player_Health -= 5
	if other.x > x{
		other.image_xscale = 1
	}
	else{
		other.image_xscale = -1
	}
}