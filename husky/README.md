This directory contains a working Docker image with ROS1 Melodic and Husky for both Mac OS (with VNC) and all other systems.

## Mac OS Setup

To use the docker image and get visuals with Mac OS, you will need to use a VNC server.

### Build the Docker container (Docker needs to be installed):

```
$ docker build --build-arg fromcontainer=tiryoh/ros-desktop-vnc:melodic -t ros-husky-vnc .
```

### Run the Docker container

```
$ docker run -p 6080:80 --shm-size=512m --name husky-melodic --restart unless-stopped -v ~/husky:/home/ubuntu/husky ros-husky-vnc
$ docker exec -it husky-melodic bash
```

You can now view your desktop by browsing to http://127.0.0.1:6080/

## Non-Mac Setup

### Build the Docker container (Docker needs to be installed):

```
docker build --build-arg fromcontainer=osrf/ros:melodic-desktop -t ros-husky .
```

### Run the Docker container

```
$ docker run -dt --name husky-melodic --restart unless-stopped -v ~/husky:/home/ubuntu/husky ros-husky
$ docker exec -it husky-melodic bash
```

## Common

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
