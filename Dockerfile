# You can specify either 'tiryoh/ros2-desktop-vnc:foxy' or 'osrf/ros:foxy-desktop'
ARG fromcontainer
FROM $fromcontainer

# Install linux packages
RUN apt update && apt install -y python3-pip

# Install navigation2
RUN apt install ros-foxy-navigation2 ros-foxy-nav2-bringup '~ros-<distro>-turtlebot3-.*' -y

# Switch to the ubuntu user
WORKDIR /home/ubuntu

# Configure our volumes and ensure the shared volumes have proper ownership
VOLUME ["/home/ubuntu/navigation2"]

# Update .bashrc
RUN echo "### BEGIN UBUNTU ENV BLOCK ###" >> ~/.bashrc
RUN echo "source \"/opt/ros/foxy/setup.bash\"" >> ~/.bashrc
RUN echo "### END UBUNTU ENV BLOCK ###" >> ~/.bashrc