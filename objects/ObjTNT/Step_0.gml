x += xVel
y = (calcY + -z) + yVel
z += zVel

////Friction
if xVel > 0.2{
	xVel -= xFalloff
}
else if xVel < -0.2{
	xVel += xFalloff	
}
else{
	xVel = 0	
}

if yVel > 0.2{
	yVel -= yFalloff
}
else if yVel < -0.2{
	yVel += yFalloff	
}
else yVel = 0

if z >= 0.2{
	zVel -= zFalloff
}

////Bouncing off Floor

else{
	
	if exploding = false{
		zVel = -zVel/2
		lerp(xVel, 0, 0.5)
	}
	if exploding = true{
		z = 0	
		xVel = xVel/2
		yVel = yVel/2
	}
}

////Bouncing off walls



//// Counts Down Fuse
if fuseTime > 0{
	fuseTime -= 1
}
//When fuse runs out
else{
	fuseTime = 0
	image_speed = 1
	exploding = true
	xVel = 0
	yVel = 0
	zVel = 0
}
