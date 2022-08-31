// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function load_game(){

/// @description Insert description here
// You can write your code in this editor

//load the game

with(pSaveMe) instance_destroy();
with(obj_player) instance_destroy();
with(pEnemy) instance_destroy();
with(oRubyCollectable) instance_destroy();

if (file_exists("save.sav"))
{
	var _buffer = buffer_load("save.sav");
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	var _loadData = json_parse(_string);
	
	
	while (array_length(_loadData) > 0)
	{
		
		var _loadEntity = array_pop(_loadData);
		
		with(instance_create_layer(0, 0, layer, asset_get_index(_loadEntity.obj)))
		{
			if (object_index == obj_player)
			{
				rubies = _loadEntity.rubies;
			}
			if (object_index == oRubyCollectable)
			{
				collected = _loadEntity.collected;
				
			}
			
			x = _loadEntity.x;
			y = _loadEntity.y;
			image_index = _loadEntity.image_index;
		}
	}
}

}