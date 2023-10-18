/// @description > object event
randomize();
created_end = false;
previous_start = {
	index_x : 6,
	index_y : 6
};
previous_end = {
	index_x : 0,
	index_y : 0
};
level = 0;
game_over = false;
win = false;
button_grid = ds_grid_create(6,6);
// create the buttons
var i = 0, j = 0;
repeat(6){
	i = 0;
	repeat(6){
		var _b = instance_create_layer(x+(i*32), y + (j*32),layer,obj_button);
		if(i==0 and j==0) {
			with(_b){
				set_start_state();
			}
		}
		with(_b){
			index_x = i;
			index_y = j;
		}
		ds_grid_add(button_grid,i,j,_b);
		i++;
	}
	j++;
}
// reset grid
reset_grid = function(){
	for(var i = 0; i < 6; i++){ // reset grid iteration
		for(var j = 0; j < 6; j++;){
			with(ds_grid_get(button_grid,i,j)){
				set_flaw_state();
				if(i==game.previous_end.index_x and j==game.previous_end.index_y) {
					set_start_state();
					game.previous_start = id; // set new start as previous end
				}
			}
		}
	}
	while(game.created_end == false){
		for(var i = 0; i < 6; i++){
			for(var j = 0; j < 6; j++;){
				with(ds_grid_get(button_grid,i,j)){
					if(game.created_end == false && state != start_state){
						// chance of create end
						if(irandom(32) == 16){
							set_end_state();
							game.previous_end = id;
							game.created_end = true;
							show_debug_message($"set ended at {i},{j}");
						}
					}
				}
			}
		}
	}
	// set path
	setpath(game.button_grid, game.previous_start.index_x, game.previous_start.index_y,
		game.previous_end.index_x, game.previous_end.index_y,
	);
// start blink
	// blink
	with(obj_button){
		if(state == safe_state){
			blinkcount = roll;
			blink();
		}
		if(state == flaw_state){
			blinkcount = irandom(max(3, 6-(game.level/40)))+1;
			blink();
		}
	}
	game.created_end = false;
}

setpath = function(grid, start_X, start_Y, end_X, end_Y){
	var _done_set_path = false;
	_done_set_path = false;
	var _safe_grid = noone;
	_safe_grid = ds_list_create();
	var _limit = 12;
	while !_done_set_path {
		show_debug_message("reset path")
		var _x = start_X, _y = start_Y;
		ds_list_clear(_safe_grid);
		_x = start_X;
		_y = start_Y;
		_limit = 12;
		show_debug_message($"start : x:{start_X} y:{start_Y}");
		show_debug_message($"end : x:{end_X} y:{end_Y}")
		while(_x != end_X || _y != end_Y) and (_limit > 0){	
			var randomDirection = 0;
			randomDirection = choose(0,1,2,3); // 0: Up, 1: Right, 2: Down, 3: Left
			switch (randomDirection) {
		        case 0: // Move up
		            if (_y > 0) _y--;
		            break;
		        case 1: // Move down
		            if (_y < 5) _y++;
		            break;
		        case 2: // Move left
		            if (_x > 0) _x--;
		            break;
		        case 3: // Move right
		            if (_x < 5) _x++;
		            break;
			}
			// break this loop when actually found the path
			if(_x == end_X and _y == end_Y){
				_done_set_path = true;
			}else if (_x == start_X and _y == start_Y){
				// do nothing
			}else{
				// dont add the start and end path
				ds_list_add(_safe_grid,[_x,_y]);	
			}
			_limit--;
		}
	}
	// set the safe state
	var _x = 0,_y = 0;
	for(var i = 0; i < ds_list_size(_safe_grid); i++){
		_x = _safe_grid[|i][0];
		_y = _safe_grid[|i][1];
		with(grid[# _x, _y]){
			if(state != end_state and state != start_state){
				set_safe_state();	
			}
		}
	}
	ds_list_destroy(_safe_grid);
}
	
//
reset_grid();
// create player
instance_create_layer(x+16,y+24,"player",obj_player);