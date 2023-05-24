/// @description destroy at room end

// delete list from memory
ds_list_destroy(global.depth_list);

// restore score to previous score if level repeated
if (global.isWon == false and score > prev_score) {
	score = prev_score;
	
	if (score == 0 and room != rm_title) {
		score++; // pity points to skip instructions
	}
}

// destroy controller
instance_destroy(id);