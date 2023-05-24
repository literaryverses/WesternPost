/// @description end animations

switch (sprite_index) {
	case spr_horse_stop:
		if (global.dist > global.total_dist) {
			global.isWon = true; // signals game won
			global.levelOver = true;
		}
		sprite_index = spr_horse_idle;
		break;
	case spr_horse_raise:
		gameOver++; // count how many times it loops
		break;
}