image_angle += rotspeed
image_alpha -= 0.01
if image_alpha <= 0{
	instance_destroy()
}
vspeed += 0.05


depth = -y

show_debug_message(image_index)