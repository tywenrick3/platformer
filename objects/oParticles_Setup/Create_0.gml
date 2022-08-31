/// Particle Setup

image_alpha = 0;  // don't show in game


particle_system = part_system_create_layer("Weather", 0);  

//lots of random experimenting and trial and error and research random particle effects used in game maker

#region Snow
// snow

particle_Snow =  part_type_create(); 
part_type_sprite(particle_Snow, spr_Particle_Snow3, 0, 0 , 1); 
part_type_size(particle_Snow, 0.5,1.2, 0 , 0);

part_type_speed(particle_Snow, 0.4,0.6, 0, 0  );
part_type_direction(particle_Snow, 270,270, 0, 15   );

part_type_life(particle_Snow, 1340,1340);
part_type_orientation(particle_Snow, 0,359 , 0,15, 0);
part_type_alpha3(particle_Snow, 0.8, 0.7, 0.1);

particle_SnowCloud = part_type_create(); 
part_type_shape(particle_SnowCloud, pt_shape_cloud );
part_type_size(particle_SnowCloud, 2,5, 0.01,  0) ;
part_type_orientation(particle_SnowCloud, 0,359 , 0, 2, 0);
part_type_life(particle_SnowCloud, 300,450);
part_type_blend(particle_SnowCloud, 1);
part_type_alpha3(particle_SnowCloud, 0.001, 0.05, 0.001   );


#endregion

