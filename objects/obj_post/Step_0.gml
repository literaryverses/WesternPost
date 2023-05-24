/// @description

// move with horse
if (global.isMove) {
	x += global.spd * 0.3;
}

// if offscreen, delete
deleteOffscreen(id);

// if horse reaches post office
var horse = instance_place(
x, y, obj_horse);

if (horse != noone
&& global.dist > global.total_dist
&& not global.levelOver
&& horse.hit == false) {
	global.isMove = false;
	horse.sprite_index = spr_horse_stop;
	audio_stop_sound(snd_galop);
// slow down horse
} else if (global.spd > 8
&& global.dist > global.total_dist) {
	global.spd -= 0.05;
	sprite_set_speed(spr_horse_run,
	sprite_get_speed(spr_horse_run)-0.05,
	spritespeed_framespersecond);
}