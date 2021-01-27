This directory contains a working Docker image with ROS1 Melodic and Husky to be run on the actual Husky.

## Initial setup
You need to perform a one-time setup on the Husky to allow the Docker container to work.

First you need to allow the Docker container to use X11 (for GUI):
```
$ xhost +local:docker
```

You will also need to copy the file `99-realsense-libusb.rules` to `/etc/udev/rules.d/99-realsense-libusb.rules`.

## Docker image
To use the docker image you need to do the following:

### Build the Docker container (Docker needs to be installed):

```
docker build --build-arg fromcontainer=osrf/ros:melodic-desktop -t ros-husky .
```

### Run the Docker container
You now need to run the Docker container.
```
$ docker run -dt --name husky-melodic --network="host" \
  --privileged --restart unless-stopped \
  -e DISPLAY=:0 \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v /etc/localtime:/etc/localtime:ro \
  -v ~/husky:/home/ubuntu/catkin_ws ros-husky
$ docker exec -it husky-melodic bash
```

To briefly summarize what the flags are doing:
- `--name husky-melodic`: this names the Docker container
- `--network="host"`: this allows the Docker container to use the Husky's network. This allows us to see rostopics published by the Husky.
- `--privileged`: this allows the Docker container to access physical hardware (ex. Intel RealSense)
- `-v ~/husky:/home/ubuntu/catkin_ws ros-husky`: creates a bind mount that allows you to edit files locally and have them synced with the Docker container.

The following enables the Docker container to use GUI applications.
```
-e DISPLAY=:0 \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v /etc/localtime:/etc/localtime:ro \
```

## Extra

### To change the ROS distribution

You can pass an additional build argument while building the enviroment:

```
--build-arg rosversion='kinetic'
```

### Stop the container

```
$ docker stop husky-melodic
```

### Stop and remove the container

```
$ docker stop husky-melodic && docker rm husky-melodic
```

### To visualize the point cloud from the RealSense
Run the following and then open RViz in a seperate terminal.
```
$ roslaunch realsense2_camera rs_camera.launch filters:=pointcloud
```