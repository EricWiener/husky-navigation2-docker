# Run with:
# chmod +x ./install_local.sh
# sudo ./install_local.sh

export rosversion='melodic'
sudo apt-get update
sudo apt-get update && apt-get install -y python3-pip \
     vim wget iputils-ping \
    "ros-${rosversion}-husky-desktop" \
    "ros-${rosversion}-husky-simulator" \
    "ros-${rosversion}-navigation" \
    "ros-${rosversion}-husky-gazebo" \
    "ros-${rosversion}-husky-viz" \
    "ros-${rosversion}-husky-navigation"