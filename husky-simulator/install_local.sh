# Run with:
# chmod +x ./install_local.sh
# sudo ./install_local.sh

export rosversion='melodic'

# Setup sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# Setup keys
sudo apt-key adv --kesyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

sudo apt-get update
sudo apt-get update && sudo apt-get install -y python3-pip \
     vim wget iputils-ping \
     "ros-${rosversion}-desktop-full" \
     "ros-${rosversion}-husky-desktop" \
     "ros-${rosversion}-husky-simulator" \
     "ros-${rosversion}-navigation" \
     "ros-${rosversion}-husky-gazebo" \
     "ros-${rosversion}-husky-viz" \
     "ros-${rosversion}-husky-navigation"