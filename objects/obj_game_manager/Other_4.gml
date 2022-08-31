if (file_exists("save_levels.sav") and room == rm_menu)
{
	load_level();
}

timeStop = false;
timeTaken = 0;


if room == rm_menu{
	if !(audio_is_playing(snd_menu)) audio_play_sound(snd_menu, 1, true);
}else{
	audio_stop_sound(snd_menu)	
}
if room == rm_boss {
	if !(audio_is_playing(snd_boss_music)) audio_play_sound(snd_boss_music, 1, true)
}else {
	audio_stop_sound(snd_boss_music)
}

if (room == rm_tutorial) or (room == rm_level_1) or (room == rm_level_2){
	if !(audio_is_playing(snd_level_bg_music)) audio_play_sound(snd_level_bg_music, 1, true);	
} 

if room == rm_boss_cut {
	if !(audio_is_playing(snd_level_bg_music)) audio_stop_sound(snd_level_bg_music)	
}
//levels_available[0] = true;

