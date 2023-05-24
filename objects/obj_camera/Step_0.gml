/// @description 

// set position of camera
camera_set_view_pos(camera, x, y);

if (global.isMove) {
	// moving camera to the right
	x += global.spd;
}