# Start out with a melodic image with Ubuntu 18.04
# You can specify either 'tiryoh/ros-desktop-vnc:melodic' or 'osrf/ros:melodic-desktop'
ARG fromcontainer='osrf/ros:melodic-desktop'
ARG rosversion='melodic'
FROM $fromcontainer

# Another thing to be careful about is that after every FROM statements all 
# the ARGs gets collected and are no longer available. 
# This holds onto the rosversion arg
ARG rosversion

# Add the ROS2 repository
RUN apt update && sudo apt install -y curl gnupg2 lsb-release
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -

# Add repository to sources list
RUN sh -c 'echo "deb [arch=$(dpkg --print-architecture)] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list'

# Install development tools and ROS packages
RUN apt update && sudo apt install -y \
  build-essential \
  cmake \
  git \
  libbullet-dev \
  python3-colcon-common-extensions \
  python3-flake8 \
  python3-pip \
  python3-pytest-cov \
  python3-rosdep \
  python3-setuptools \
  python3-vcstool \
  wget

# install some pip packages needed for testing
RUN -m pip install -U -y \
  argcomplete \
  flake8-blind-except \
  flake8-builtins \
  flake8-class-newline \
  flake8-comprehensions \
  flake8-deprecated \
  flake8-docstrings \
  flake8-import-order \
  flake8-quotes \
  pytest-repeat \
  pytest-rerunfailures \
  pytest

# install Fast-RTPS dependencies
RUN apt install --no-install-recommends -y \
  libasio-dev \
  libtinyxml2-dev

# install Cyclone DDS dependencies
RUN apt install --no-install-recommends -y \
  libcunit1-dev

# Get ROS2 code
RUN mkdir -p ~/ros2_foxy/src
WORKDIR /ros2_foxy
RUN wget https://raw.githubusercontent.com/ros2/ros2/foxy/ros2.repos
RUN vcs import src < ros2.repos

# Install dependencies
RUN rosdep init
RUN rosdep update
RUN rosdep install --from-paths src --ignore-src --rosdistro foxy -y --skip-keys "console_bridge fastcdr fastrtps rti-connext-dds-5.3.1 urdfdom_headers"
RUN colcon build --symlink-install

# Set up ROS bridge
ENV ROS1_DISTRO melodic
ENV ROS2_DISTRO foxy

# install ros packages
# RUN apt-get update && apt-get install -y \
#     ros-melodic-ros-comm \
#     ros-melodic-roscpp-tutorials \
#     ros-melodic-rospy-tutorials \
#     && rm -rf /var/lib/apt/lists/*

# install ros2 packages
# RUN apt-get update && apt-get install -y --no-install-recommends \
#     ros-foxy-ros1-bridge=0.9.6-1* \
#     ros-foxy-demo-nodes-cpp=0.9.3-1* \
#     ros-foxy-demo-nodes-py=0.9.3-1* \
#     && rm -rf /var/lib/apt/lists/*

# setup entrypoint
COPY ./ros_entrypoint.sh /
