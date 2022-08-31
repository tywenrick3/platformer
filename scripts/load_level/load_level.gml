// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function load_level(){

/// @description Insert description here
// You can write your code in this editor

//load the game

with(obj_game_manager) instance_destroy();

if (file_exists("save_levels.sav"))
{
	var _buffer = buffer_load("save_levels.sav");
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	var _loadData = json_parse(_string);
	

	
	while (array_length(_loadData) > 0)
	{	
		
		var _loadEntity = array_pop(_loadData);
		
		with(instance_create_layer(0, 0, layer, asset_get_index(_loadEntity.obj)))
		{
			
			levels_available = _loadEntity.levels_available;
			current_level = _loadEntity.current_level;
			
		}
	}
}

}