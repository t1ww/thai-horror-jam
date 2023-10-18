/// @description > object event


// if gameover, draw game over text
if(game_over){
	if(win){
		draw_text(300,300,"YOU WIN");
	}else{
		draw_text(300,300,"GAME OVER");
		draw_text(300,320,$"Level reached : {level}");
	}
	draw_text(300,340,"press R to restart");
	if(keyboard_check_pressed(ord("R"))){game_restart();}
	exit;
}
// draw score on top left
draw_set_font(fnt_m5x7);
draw_set_halign(fa_bottom);
draw_set_valign(fa_center);
draw_text(200,50,$"Level : {level}");
draw_text(200,90,$"start : x:{previous_start.index_x} y:{previous_start.index_y}")
draw_text(200,100,$"end : x:{previous_end.index_x} y:{previous_end.index_y}")
// //
draw_text(200,200,"WASD to move");
draw_text(200,210,"Or Arrow keys to move");
draw_text(200,220,"LShift to sprint");