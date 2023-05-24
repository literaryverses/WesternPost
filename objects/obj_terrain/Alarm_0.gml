/// @description make obstacles

// make obstacles
if (global.isMove
&& global.dist < global.total_dist) {
	obstacleCases(id);
}

// use equation to get time
time_upper = eqTime(false);
time_lower = eqTime(true);

// generate random float
time = random_range(time_lower, time_upper);

// second generation option
//time = (8*0.69)/global.spd;

// reset alarm
alarm[0] = room_speed*time;

