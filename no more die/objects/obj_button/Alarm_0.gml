/// @description > object event
//
if(game.game_over)exit;
//
if(state == end_state) exit;
if(state == start_state) exit;

if blinkcount > 0 {
	if(image_index == 2){
		//stop blinking
		blinkcount = 0;
		alarm[0] = -1;
		exit;
	}
	if(image_index == 0){
		image_index = 1; // light on
	}else{
		image_index = 0; // light off
	}
	blinkcount--;
	if(blinkcount == 0){image_index = 0;}
	alarm[0] = max(1,10 - (game.level/10));
}
