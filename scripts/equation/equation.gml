function eqTime(isNegation) {
	// get controller instance to access variables
	var _id = instance_find(obj_controller, 0);
	var h = _id.optTime;
	var k = _id.finalSpd;
	var a = _id.coeff;
	var ansTime = 0; // answer to return
	
	if (isNegation) {
		ansTime = -sqrt((global.spd-k)/a)+h;
	} else {
		ansTime = sqrt((global.spd-k)/a)+h;
	}
	
	if (ansTime > 0) {
		return ansTime;
	} else {
		return 0;
	}
}