This repository contains a working Docker image with ROS2 Foxy and Navigation2 for both Mac OS (with VNC) and all other systems.

## Instructions:

Clone this repository to wherever you like to keep your Git Repos. Example:

```
$ git clone <repo url> ~/repositories/husky-nav2
```

Then sym-link the nav2 and husky folders:

```
$ ln -s ~/repositories/husky-nav2/husky ~/husky
$ ln -s ~/repositories/husky-nav2/navigation2 ~/navigation2
```

### ROS2 Foxy and Navigation2

To setup this docker image, navigate into the `nav2` directory and follow the README there.

### ROS Melodic and Husky

To setup this docker image, navigate into the `husky` directory and follow the README there.
