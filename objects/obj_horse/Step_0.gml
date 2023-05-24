/// @description

// keyboard input
var keyup = keyboard_check_pressed(vk_up);
var keydown = keyboard_check_pressed(vk_down);
var keyspace = keyboard_check_pressed(vk_space);
//var keyright = keyboard_check_pressed(vk_right);

// moving up
if (keyup && depth < 2
&& sprite_index != spr_horse_idle
&& not global.levelOver
&& not collideSideways(true)) {
	y -= 32;
	depth++;
	if (hit == true) {
		global.isMove = true;
		hit = false;
		audio_play_sound(snd_galop, 1, true);
	}
}

// moving down
if (keydown && depth > 0
&& sprite_index != spr_horse_idle
&& not global.levelOver 
&& not collideSideways(false)) {
	y += 32;
	depth--;
	if (hit == true) {
		global.isMove = true;
		hit = false;
		audio_play_sound(snd_galop, 1, true);
	}
}

// stopping or running horse
if (keyspace && global.isMove == true) {
	global.isMove = false;
	sprite_index = spr_horse_stop;
	audio_stop_sound(snd_galop);
} else if (keyspace && global.isMove == false
&& sprite_index = spr_horse_idle
&& not global.levelOver) {
	global.isMove = true;
	audio_play_sound(snd_galop, 1, true);
}

// if horizontal collision happens
if (collideForward()) {
    hit = true;
	global.isMove = false;
	sprite_index = spr_horse_raise;
	audio_stop_sound(snd_galop);
	if (not audio_is_playing(snd_neigh)) {
		audio_play_sound(snd_neigh, 1, false);
	}
} else if (global.isMove == true) {
	x += global.spd; // move horse with camera
	global.dist++;
	score++;
	sprite_index = spr_horse_run;// raise score
}

// detract score
if (sprite_index == spr_horse_raise
&& not global.levelOver) {
	score--;
}

// game over if animation looped 3 times
if (gameOver == 3) {
	global.levelOver = true;
	score *= global.dist/global.total_dist;
	global.isMove = false;
	sprite_index = spr_horse_raise;
	audio_play_sound(snd_neigh, 1, true);
	gameOver++;
}