function makeObstacle(_id, spr, height, _depth){
	// create instance of obstacle
	var obst = instance_create_layer(
	x, y-height+_id.sprite_height, "Instances", obj_obstacle);
	
	// instance parameters
	obst.state = _id.state;
	obst.depth = _depth;
	obst.sprite_index = spr;
	
	// update depth list
	for (var i = 0; i < 2; i++)	{
	    if (global.depth_list[| i] == _depth) {
	        break;
	    } else if (i == 1) {			
			ds_list_delete(global.depth_list, 0);
			ds_list_add(global.depth_list, _depth);
		}
	}
}

function obstacleCases(_id){
	// get sprite
	var spr = -1;
	switch(_id.state) {
		case Biome.Rocky:
			spr = spr_tree;
			break;
		case Biome.Desert:
			spr = spr_cactus;
			break;
	}

	// get sprite height
	var height = sprite_get_height(spr);
	
	// choose position based on distance
	var chosen = irandom_range(0,2);
	if (_id.time <  0.685*8/global.spd
	and ds_list_find_value(global.depth_list, 0)
	!= -1 and ds_list_find_value(global.depth_list, 1)
	!= -1) {
		while (chosen != ds_list_find_value(
		global.depth_list, 0) and chosen !=
		ds_list_find_value(global.depth_list, 1)) {
			chosen = irandom_range(0,2);
			
			/*// proofreading stuck in loop
			show_debug_message("loop1");
			show_debug_message("list 0");
			show_debug_message(string(ds_list_find_value(global.depth_list, 0)));
			show_debug_message("list 1");
			show_debug_message(string(ds_list_find_value(global.depth_list, 1)));
			show_debug_message("chosen");
			show_debug_message(string(chosen));
			*/
		}
	} else if (global.dist > global.total_dist/4) {
		while (chosen == ds_list_find_value(
		global.depth_list, 0) or chosen ==
		ds_list_find_value(global.depth_list, 1)) {
			chosen = irandom_range(0,2);

			/*// proofreading stuck in loop
			show_debug_message("loop2");
			show_debug_message("list 0");
			show_debug_message(string(ds_list_find_value(global.depth_list, 0)));
			show_debug_message("list 1");
			show_debug_message(string(ds_list_find_value(global.depth_list, 1)));
			show_debug_message("chosen");
			show_debug_message(string(chosen));
			*/
		}
	}
	
	//delete
	show_debug_message("end loop");
	
	// create obstacle based on position
	switch (chosen) {
		case 0:
			makeObstacle(_id, spr, height, 0);
			break;
		case 1:
			makeObstacle(_id, spr, height+32, 1);
			break;
		case 2:
			makeObstacle(_id, spr, height+32*2, 2);
			break;
	}
}