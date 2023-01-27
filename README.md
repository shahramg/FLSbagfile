# FLSbagfile
This repository creates bag files that describe the flight path of FLSs to render illuminations.  A Flying Light Speck, FLS, is a miniature sized drone configured with light sources.  Swarms of FLSs will illuminate an object in a 3D volume, an FLS display.  Computing the flight path of FLSs to render an illumination is both computationally expensive and time consuming.  This repository contains MATLAB software to store these flight paths in a bag file.  These bag files may be used in a simulation model (e.g., AirSim) that evaluates alternative lighting designs for FLSs and their rendering of different scenes.

Authors:  Hamed Alimohammadzadeh, Daryon Mehrabon, Shahram Ghandeharizadeh (shahram@usc.edu)

# Features

  * Store the flight paths of FLSs to illuminate a motion illumination in a bag file. 
  * Render a specific point cloud of a sequence that constitutes a scene. 
  * Render a specific scene.
  * Render a range of point clouds in a sequence that constitutes a scene.
  * Fetch a point cloud given its id in a sequence that constitutes a scene.

# Limitations
The flight path of FLSs must be formatted as described in Section Input.

# Getting the Source
```bash
git clone https://github.com/shahramg/FLSbagfiles
```

# Environment
Install MATLAB with support for ROS.  This software was developed using MATLAB R2022b for academic use. 
Launch MATLAB from the directory that contains FLSbagfiles.
Initialize ROS by issuing the following line in the command line:
```bash
rosinit
```
