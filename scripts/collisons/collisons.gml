function collideForward() {
	var _x = 0;
	/*
	if (toDestroy) {
		_x = x+32;
	} else {
		_x = x;
	}*/
	_x = x;

	// horizontal collision
	var _inst = instance_place(
	_x, y, obj_obstacle);
	
	if (_inst != noone && _inst.depth == depth
	&& _inst.x > _x - sprite_width*0.4
	&& _inst.x < _x + sprite_width/2-20) {
		/*
		if (toDestroy) { // Attacked?
			instance_destroy(_inst)
			return false;
		} else {
			return true;
		}*/
		return true;
	} else {
		return false;
	}
}

function collideSideways(isUp) {
	var adjust = 0;
	if isUp {
		adjust = -1;
	} else {
		adjust = 1; 
	}
	var _list = ds_list_create();
	var _num = collision_rectangle_list(
	x - sprite_width*0.09, 
	y + sprite_height/2, 
	x + sprite_width/2-30, 
	y, obj_obstacle, false, true,
	_list, false);
	if _num > 0 {
		for (var i = 0; i < _num; ++i;) {
			if (depth - adjust == 
			_list[| i].depth) {
				
				audio_play_sound(snd_snort, 1, false);

				return true;
			}
		}
	}
	ds_list_destroy(_list);
	return false;
}