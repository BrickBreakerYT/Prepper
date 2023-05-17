if Collected{
	global.Player_Health = lerp(global.Player_Health, HealTo, 0.05)
	
	if global.Player_Health > HealTo -0.5 && global.Player_Health < HealTo + 0.5{
		instance_destroy()
	}
}