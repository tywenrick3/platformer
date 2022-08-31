/// @description Delete if no needed

// delete the step event if the particle weather system doesn't need moving with the camera

//updates the current x and y of the camera
xStart = camera_get_view_x( view_camera[0] );
yStart = camera_get_view_y( view_camera[0] );

// updates the emitter region place to spawn new particles
      part_emitter_region(oParticles_Setup.particle_system, emitterSnow,  xStart - 20,  xStart + CameraWidth +20, yStart, yStart, ps_shape_rectangle,  ps_distr_linear );
      part_emitter_region(oParticles_Setup.particle_system, emitterSnowCloud,  xStart - bufferX,  xStart + CameraWidth + bufferX, yStart, yStart + CameraHeight, ps_shape_rectangle,  ps_distr_linear );	  