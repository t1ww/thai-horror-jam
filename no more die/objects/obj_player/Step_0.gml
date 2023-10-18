/// @description > object event
if(game.game_over)exit;

var _keyleft = keyboard_check(vk_left) || keyboard_check(ord("A"));
var _keyright = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _keyup = keyboard_check(vk_up) || keyboard_check(ord("W"));
var _keydown = keyboard_check(vk_down) || keyboard_check(ord("S"));
var _keysprint = keyboard_check(vk_lshift);
//
dirx = _keyright - _keyleft;
diry = _keydown - _keyup;

input_dir = point_direction(0,0,dirx,diry);
input_mag = (dirx != 0) || (diry != 0);

var _spd = (_keysprint)?run_speed : walk_speed;

hsp = lengthdir_x(input_mag * _spd, input_dir);
vsp = lengthdir_y(input_mag * _spd, input_dir);
// flip img
if(hsp != 0){
	image_xscale = sign(hsp);	
}
// collision check
move_and_collide(hsp,vsp,col)

if(place_meeting(x,y,obj_button)){
	with(instance_place(x,y,obj_button)){
		press();	
	}	
}