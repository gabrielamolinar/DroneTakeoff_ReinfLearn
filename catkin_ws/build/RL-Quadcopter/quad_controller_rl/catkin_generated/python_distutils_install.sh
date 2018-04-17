#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/mnt/hgfs/UdacityFiles_trial1/catkin_ws/src/RL-Quadcopter/quad_controller_rl"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/mnt/hgfs/UdacityFiles_trial1/catkin_ws/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/mnt/hgfs/UdacityFiles_trial1/catkin_ws/install/lib/python2.7/dist-packages:/mnt/hgfs/UdacityFiles_trial1/catkin_ws/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/mnt/hgfs/UdacityFiles_trial1/catkin_ws/build" \
    "/usr/bin/python" \
    "/mnt/hgfs/UdacityFiles_trial1/catkin_ws/src/RL-Quadcopter/quad_controller_rl/setup.py" \
    build --build-base "/mnt/hgfs/UdacityFiles_trial1/catkin_ws/build/RL-Quadcopter/quad_controller_rl" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/mnt/hgfs/UdacityFiles_trial1/catkin_ws/install" --install-scripts="/mnt/hgfs/UdacityFiles_trial1/catkin_ws/install/bin"
