This repository contains a working Docker image with ROS2 Foxy and Navigation2 for both Mac OS (with VNC) and all other systems.

### Install

Clone the repository to ~/navigation2

```
$ cd ~
$ git clone <repo-url> navigation2
```

You can also clone it anywhere and just create a symlink:

```
$ ln -s <path to clones navigation 2> ~/navigation2
```

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
docker build --build-arg fromcontainer=osrf/ros2:foxy-desktop -t ros2-nav2 .
```

### Run the Docker container

```
$ docker run -dt --name nav-foxy --restart unless-stopped -v ~/navigation2:/home/ubuntu/navigation2 ros2-nav2
$ docker exec -it nav-foxy bash
```

## Common

### Stop the container

```
$ docker stop nav-foxy
```

### Stop and remove the container

```
$ docker stop nav-foxy && docker rm nav-foxy
```
