# You can specify either 'tiryoh/ros2-desktop-vnc:foxy' or 'osrf/ros:foxy-desktop'
ARG fromcontainer='osrf/ros:foxy-desktop'
ARG rosversion='foxy'
FROM $fromcontainer

# Another thing to be careful about is that after every FROM statements all 
# the ARGs gets collected and are no longer available. 
# This holds onto the rosversion arg
ARG rosversion

# Install linux packages
RUN apt-get update && apt-get install -y python3-pip vim wget

# Install navigation2
RUN apt-get install "ros-${rosversion}-navigation2" "ros-${rosversion}-nav2-bringup" "~ros-${rosversion}-turtlebot3-.*" -y

# Switch to the ubuntu user
WORKDIR /home/ubuntu

# Configure our volumes and ensure the shared volumes have proper ownership
VOLUME ["/home/ubuntu/navigation2"]

# Update .bashrc
RUN echo "### BEGIN UBUNTU ENV BLOCK ###" >> ~/.bashrc
RUN echo "source \"/opt/ros/${rosversion}/setup.bash\"" >> ~/.bashrc
RUN echo "### END UBUNTU ENV BLOCK ###" >> ~/.bashrc