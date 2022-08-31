//juice effect #3

image_alpha = 0;  

bufferX = 500;   // buffer left and right outsite from camera


 // Capture x,y and with + height of camera 0
xStart = camera_get_view_x(view_camera[0]);
yStart = camera_get_view_y(view_camera[0]);
 
CameraWidth = camera_get_view_width(view_camera[0]);
CameraHeight = camera_get_view_height(view_camera[0]);
  
  
// Blank emitter, region/space to use , stream 
emitterSnow = part_emitter_create(oParticles_Setup.particle_system); 
emitterSnowCloud = part_emitter_create(oParticles_Setup.particle_system);

// Create snow particles
part_emitter_region(oParticles_Setup.particle_system, emitterSnow,  xStart - bufferX,  xStart + CameraWidth + bufferX, yStart, yStart, ps_shape_rectangle,  ps_distr_linear );
part_emitter_stream(oParticles_Setup.particle_system, emitterSnow, oParticles_Setup.particle_Snow, 5 );
  
// Create snow clouds 
part_emitter_region(oParticles_Setup.particle_system, emitterSnowCloud,  xStart - bufferX,  xStart + CameraWidth + bufferX, yStart, yStart + CameraHeight, ps_shape_rectangle,  ps_distr_linear );
part_emitter_stream(oParticles_Setup.particle_system, emitterSnowCloud, oParticles_Setup.particle_SnowCloud, -2 );
   

