/// @description 

// grab camera exposition
var _cam_x = camera_get_view_x(
view_camera[0]);

switch(room) {
	case rm_rocky:
		// create parallax with backgrounds
		layer_x("parallax_2", cloud1x);
		layer_x("parallax_3", _cam_x * 0.8);
		layer_x("parallax_4", _cam_x * 0.7);
		layer_x("parallax_5", _cam_x * 0.6);
		layer_x("parallax_6", _cam_x * 0.5);
		layer_x("parallax_7", cloud2x);

		// move clouds separately
		if (global.isMove) {
			cloud1x+=(global.spd*0.9);
			cloud2x+=(global.spd*0.65);
		} else {
			cloud1x-=0.1;
			cloud2x+=0.7;
		}
		break;
	case rm_desert:
		// create parallax with backgrounds
		layer_x("parallax_2", _cam_x);
		layer_x("parallax_3", cloud1x);
		layer_x("parallax_4", cloud1x);
		layer_x("parallax_5", _cam_x * 0.8);
		layer_x("parallax_6", _cam_x * 0.6);
		layer_x("parallax_7", _cam_x * 0.4);
		layer_x("parallax_8", _cam_x * 0.3);
		layer_x("parallax_9", _cam_x * 0.2);
		// move clouds separately
		if (global.isMove) {
			cloud1x+=(global.spd*0.9);
		} else {
			cloud1x-=0.1;
		}
		break;
	case rm_plateau:
		// create parallax with backgrounds
		layer_x("parallax_1", _cam_x);
		layer_x("parallax_2", cloud1x);
		layer_x("parallax_3", cloud2x);
		layer_x("parallax_4", _cam_x * 0.8);
		layer_x("parallax_5", _cam_x * 0.6);
		layer_x("parallax_6", _cam_x * 0.4);

		// move clouds separately
		if (global.isMove) {
			cloud1x+=(global.spd*0.9);
			cloud2x+=(global.spd*0.65);
		} else {
			cloud1x-=0.1;
			cloud2x+=0.7;
		}
		break;
	
}