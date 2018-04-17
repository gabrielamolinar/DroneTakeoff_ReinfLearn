execute_process(COMMAND "/mnt/hgfs/UdacityFiles_trial1/catkin_ws/build/RL-Quadcopter/quad_controller_rl/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/mnt/hgfs/UdacityFiles_trial1/catkin_ws/build/RL-Quadcopter/quad_controller_rl/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
