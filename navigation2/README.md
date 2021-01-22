This directory contains a Dockerfile with ROS2 Foxy and Navigation2 for both Mac OS (with VNC) and all other systems. It also contains a ROS1 Melodic and Husky Dockerfile for both Mac OS (with VNC) and all other systems.

## Mac OS Setup

To use the docker image and get visuals with Mac OS, you will need to use a VNC server.

### Build the Docker container (Docker needs to be installed):

```
$ docker build --build-arg fromcontainer=tiryoh/ros2-desktop-vnc:foxy -t ros2-nav2-vnc .
```

### Run the Docker container

```
$ docker run -p 6080:80 --shm-size=512m --name nav-foxy --restart unless-stopped -v ~/navigation2:/home/ubuntu/navigation2 ros2-nav2-vnc
$ docker exec -it nav-foxy bash
```

You can now view your desktop by browsing to http://127.0.0.1:6080/

## Non-Mac Setup

### Build the Docker container (Docker needs to be installed):

```
docker build --build-arg fromcontainer=osrf/ros:foxy-desktop -t ros2-nav2 .
```

### Run the Docker container

```
$ docker run -dt --name nav-foxy --restart unless-stopped -v ~/navigation2:/home/ubuntu/navigation2 ros2-nav2
$ docker exec -it nav-foxy bash
```

## Common

### To change the ROS distribution

You can pass an additional build argument while building the enviroment:

```
--build-arg rosversion='foxy'
```

### Stop the container

```
$ docker stop nav-foxy
```

### Stop and remove the container

```
$ docker stop nav-foxy && docker rm nav-foxy
```

### To enable networking and access ROS topics from outside the docker image

Add `--network="host"` to the `docker run` command.
