# This is an auto generated Dockerfile for ros:ros1-bridge
# generated from docker_images_ros2/ros1_bridge/create_ros_ros1_bridge_image.Dockerfile.em
FROM ros:foxy-ros-base-focal

# setup keys
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# setup sources.list
RUN echo "deb http://packages.ros.org/ros/ubuntu focal main" > /etc/apt/sources.list.d/ros1-latest.list

ENV ROS1_DISTRO noetic
ENV ROS2_DISTRO foxy

# install ros packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-noetic-ros-comm=1.15.9-1* \
    ros-noetic-roscpp-tutorials=0.10.2-1* \
    ros-noetic-rospy-tutorials=0.10.2-1* \
    && rm -rf /var/lib/apt/lists/*

# install ros2 packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-foxy-demo-nodes-cpp=0.9.3-1* \
    ros-foxy-demo-nodes-py=0.9.3-1* \
    && rm -rf /var/lib/apt/lists/*
    # ros-foxy-ros1-bridge=0.9.6-1* \

# Install ROS1 listener to make sure Docker container is working
# RUN mkdir -p /home/ubuntu/catkin_ws/src
# WORKDIR /home/ubuntu/catkin_ws/src
# RUN git clone https://github.com/EricWiener/ros-melodic-listener.git

# Install the bridge from source
RUN mkdir -p /home/ubuntu/colcon_ws/src
WORKDIR /home/ubuntu/colcon_ws/src
RUN git clone https://github.com/ros2/ros1_bridge.git
RUN source /opt/ros/foxy/setup.bash
WORKDIR /home/ubuntu/colcon_ws/
RUN colcon build --symlink-install --packages-skip ros1_bridge
RUN source /opt/ros/noetic/setup.bash

# Source local workspace
RUN source install/local_setup.bash

# Source ROS1 and ROS2 workspaces

# Build bridge
RUN colcon build --symlink-install --packages-select ros1_bridge --cmake-force-configure

