Build:
docker build -t ros-bridge-tutorial .

Run:
docker run -dt --name bridge-tut --restart unless-stopped --network="host" ros-bridge-tutorial
docker exec -it bridge-tut bash

# Check you can listen to messages at all
First delete the `ros_entrypoint.sh`: `rm /ros_entrypoint.sh`.
```
source /opt/ros/noetic/setup.bash
rostopic list
```
You should get the list of topics that are running on your local computer

# Setup ROS Bridge
Make sure nothing is sourced to start with: `echo $ROS_VERSION` should be blank.

You should first build everything but the ROS 1 bridge with 
normal colcon arguments. We don't recommend having your
ROS 1 environment sourced during this step as it can add 
other libraries to the path.
```
cd /home/ubuntu/colcon_ws
source /opt/ros/foxy/setup.bash
colcon build --symlink-install --packages-skip ros1_bridge
```

Next you need to source the ROS 1 environment
```
source /opt/ros/noetic/setup.bash
```

You must add any ROS 1 or ROS 2 workspaces that 
have message/service packages that you want to be bridged to your path before building the bridge. 
Alternatively you can do it manually by sourcing the relevant workspaces yourself

You have already sourced your ROS installation Source your ROS 2 installation: `. <install-space-with-ros2>/local_setup.bash`
```
# Which of these should I source?
source install/local_setup.bash
source /opt/ros/foxy/local_setup.bash
```

# Source ROS1 and ROS2 workspaces

# Then build just the ROS 1 bridge:
```
colcon build --symlink-install --packages-select ros1_bridge --cmake-force-configure
```