/// esse step event o gm roda no ultimo frame 
//centralizada no player - primeiro vamos checar que o player existe 

var _camW = camera_get_view_width(view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);



if instance_exists(obj_player)
{
	x = obj_player.x - _camW/2;
	y = obj_player.centerY - _camH/2;
}

//bordas da camera
x = clamp(x, 0, room_width - _camW);
y = clamp(y, 0, room_height - _camH );

//camera position 
camera_set_view_pos( view_camera[0], x , y);