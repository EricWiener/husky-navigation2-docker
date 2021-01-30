# You can specify either 'tiryoh/ros-desktop-vnc:melodic' or 'osrf/ros:melodic-desktop'
ARG fromcontainer='osrf/ros:melodic-desktop'
ARG rosversion='melodic'
FROM $fromcontainer

# Another thing to be careful about is that after every FROM statements all 
# the ARGs gets collected and are no longer available. 
# This holds onto the rosversion arg
ARG rosversion

# Install linux packages
RUN apt-get update && apt-get install -y python3-pip \
     vim wget iputils-ping \
    "ros-${rosversion}-husky-desktop" \
    "ros-${rosversion}-husky-simulator" \
    "ros-${rosversion}-navigation" \
    "ros-${rosversion}-husky-gazebo" \
    "ros-${rosversion}-husky-viz" \
    "ros-${rosversion}-husky-navigation"

# Switch to the ubuntu user
RUN mkdir -p /home/ubuntu
WORKDIR /home/ubuntu

# Configure our volumes and ensure the shared volumes have proper ownership
VOLUME ["/home/ubuntu/catkin_ws"]

# Update .bashrc
RUN echo "### BEGIN UBUNTU ENV BLOCK ###" >> ~/.bashrc
RUN echo "source \"/opt/ros/${rosversion}/setup.bash\"" >> ~/.bashrc
RUN echo "### END UBUNTU ENV BLOCK ###" >> ~/.bashrc