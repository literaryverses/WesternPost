// most you want horse to travel - keep even!
global.total_dist = 1;

// set parameters
switch (room) {
	case rm_title:
		score = 0;
		break;
	case rm_rocky:
		global.total_dist = 25000;
		break;
	case rm_desert:
		global.total_dist = 15000;
		break;
	case rm_plateau:
		global.total_dist = 10000;
		break;
}

prev_score = score;
global.spd = 0; // speed of camera / player
global.levelOver = false; // when game is over
global.dist = 0; // measures distance traveled by horse (in frames)
global.isMove = false;
global.isWon = false;

// list of last two positions used for obstacles
global.depth_list = ds_list_create();
ds_list_add(global.depth_list, -1);
ds_list_add(global.depth_list, -1);

x = 1.35*camera_get_view_width(view_camera[0]);

// calculate variables for optimal generation
finalSpd = 8+global.total_dist/100*0.2; // allows customizable win scores
optTime = 0.685*8/finalSpd;
coeff = (8 - finalSpd)/sqr(1-optTime);