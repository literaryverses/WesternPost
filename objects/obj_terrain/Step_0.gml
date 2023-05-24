/// @description

// move with camera
if (global.isMove) {
	x += global.spd;
}

// make sure alarm is reset only at end
if (!instance_place(
x+sprite_width, y, obj_terrain)
&& alarm[0] == -1
&& global.dist < global.total_dist) {
	while (alarm[0] < 1) {
		time = random_range(time_lower, time_upper);
		//time = (8*0.685)/global.spd;
		alarm[0] = time*room_speed;
	}
}