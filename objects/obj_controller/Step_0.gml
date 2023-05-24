/// @description

// make sure music is playing
check_music();

// continue or restart level
var next = keyboard_check_pressed(vk_enter);

// restart entire game
if (keyboard_check_pressed(vk_escape)) {
	game_restart();
}

// moving controller with horse
if (global.isMove) {
	x += global.spd;
	global.dist++;
}

// changing speed based on score
if (global.dist % 101 == 100
&& global.spd < finalSpd
&& global.isMove) {
	global.spd += 0.2;
	sprite_set_speed(spr_horse_run,
	sprite_get_speed(spr_horse_run)+0.2,
	spritespeed_framespersecond);
}

if (room == rm_title) {
	if next { // contnue from title screen
		room_goto_next();
	}
} else {
	// set up the ending of the level
	if (global.total_dist == global.dist) {
			// get parameters to create post office
			var swidth = sprite_get_width(spr_post);
			var sheight = sprite_get_height(spr_post);
			var rx = x;
			var ry = camera_get_view_height(view_camera[0]);
			
			// create instance
			instance_create_layer(rx + 2*swidth, ry - 32*2 - sheight,
			"Instances", obj_post);
	}
	
	// press enter key and game is over?
	if (next and global.levelOver) {
		if (!global.isWon) {
			room_restart();
		// last room, restart game
		} else if (room == rm_rocky) {
			game_restart();
		} else { // other rooms, next room
			room_goto_next();
		}
	}
}