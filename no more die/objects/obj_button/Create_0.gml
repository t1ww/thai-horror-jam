/// @description > object event
// init vars
sprite_index = spr_button;
blinkcount = 0;
roll = 6;
game_over = false;
index_x = 0;
index_y = 0;

// none, blink, pressed, end, start, flaw(test)

// state setter
no_state = function(){}
set_start_state = function(){
	show_debug_message("setting start place");
	// set sprite
	image_index = 4;
	// set state
	game.previous_end = id;
	state = start_state;
}
set_end_state = function(){
	// set sprite
	image_index = 3;
	// set state
	state = end_state;
}
set_safe_state = function(){
	// set sprite
	image_index = 0;
	// set state
	state = safe_state;
}
set_flaw_state = function(){
	// set sprite
	image_index = 0;
	image_index = 5; //test
	// set state
	state = flaw_state;
}
/// state handle
// state start
start_state = function(){
	// do nothing	
}
// state end
end_state = function(){
	// if contact player, pressed
}
// state safe
safe_state = function(){
	// blink once
	
	// if contact player, pressed
	
}
// state flaw
flaw_state = function(){
	// blink multiples times
	
	// if contact player, pressed
	
}
state = no_state;
// func
blink = function() {
	alarm[0] = max(10, 30-(game.level/5));
}
press = function(){
	switch(state){
		case safe_state :
			image_index = 2;
		break;
		case flaw_state :
			// game over
			image_index = 2;
			game.game_over = true;
			layer_set_visible("Assets_1",false);
		break;
		case end_state :
			image_index = 4;
			// reset path
			with(game){
				reset_grid();
				level++;
			}
		break;
	}
}
