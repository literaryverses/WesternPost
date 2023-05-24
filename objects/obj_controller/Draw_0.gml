/// @description 

// draw scoreboard
draw_set_halign(fa_right)
draw_set_color(c_white);
draw_set_font(fnt_score);
draw_text(x+158, 25, "SCORE: " + string(score));
draw_text(x, 10, "PROGRESS:");
draw_rectangle(x+3, 17-2, x+150+7, 17+7, false);
draw_set_color(c_lime);
draw_rectangle(x+5, 17, x+5+global.dist/(global.total_dist+430)
*150, 17+5, false);

// display text
if (global.isWon) {
	drawMenu(x-500);
	draw_set_halign(fa_center);
	draw_set_font(fnt_game);
	draw_set_color(c_yellow);
	draw_text(x-450,290, "YOU WIN!");
	draw_set_font(fnt_score);
	draw_text(x-450,356, "SCORE: "+string(score));
	if (room == rm_rocky) { // last level
		draw_text(x-450,376, "Congratulations!");
	} else {
		draw_text(x-450,376, "Press Enter to Continue");
	}
} else if (global.levelOver) {
	drawMenu(x-500);
	draw_set_halign(fa_center);
	draw_set_font(fnt_game);
	draw_set_color(c_yellow);
	draw_text(x-450,290, "YOU LOSE!");
	draw_set_font(fnt_score);
	draw_text(x-450,356, "SCORE: "+string(score));
	draw_text(x-450,376, "Press Enter to Continue");
} else if (score == 0
and room != rm_title) {
	drawMenu(x-500);
	draw_set_halign(fa_center);
	draw_set_font(fnt_score);
	draw_set_color(c_yellow);
	draw_text(x-450,300, "INSTRUCTIONS");
	draw_text(x-450,325, "Start/Stop: Space");
	draw_text(x-450,350, "Turn: Up and down");
	draw_text(x-450,375, "Horse will not let you run into obstacles");
}

/*
// collision mask visualizer
var _id = instance_find(obj_horse, 0);
draw_set_color(c_red);
draw_rectangle(_id.x - _id.sprite_width*0.09, 
	_id.y + _id.sprite_height/2, 
	_id.x + _id.sprite_width/2-50, 
	_id.y, false);
*/