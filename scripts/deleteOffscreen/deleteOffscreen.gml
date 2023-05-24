function deleteOffscreen(_id){
	if (_id.x + _id.sprite_width < 
	camera_get_view_x(view_camera[0])) {
		instance_destroy(_id);
	}
}