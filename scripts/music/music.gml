function check_music(){
	// if background music is not playing
	if (not audio_is_playing(msc_song_1)
	and not audio_is_playing(msc_song_2)
	and not audio_is_playing(msc_song_3)
	and not audio_is_playing(msc_song_4)) {

		randomise(); // randomize seed for choose()
	
		msc_song = choose( // select background music
		msc_song_1,
		msc_song_2,
		msc_song_3,
		msc_song_4);
	
		// play background music
		audio_play_sound(msc_song, 2, false);
	}
}