/// @description

// customizable biomes:
// add sprites in obstacles script
enum Biome {
	Rocky,
	Desert
}

// set parameters
depth = 3;
state = -1;
time_lower = 0.685;
time_upper = 1;
time = 1;

// generate obstacles if at end
if (not instance_place(
x+sprite_width, y, obj_terrain)) {
	// generate obstacles evenly
	alarm[0] = room_speed;
}