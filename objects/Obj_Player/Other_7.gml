throwing = false

if sprite_index = SprPlrThrowTNT{
var TNT = instance_create_layer(x,y, "Instances",ObjTNT)
TNT.xVel = -image_xscale * 2
}