# FLSbagfile
This repository creates bag files that describe the flight path of FLSs to render illuminations.  A Flying Light Speck, FLS, is a miniature sized drone configured with light sources.  Swarms of FLSs will illuminate an object in a 3D volume, an FLS display.  Computing the flight path of FLSs to render an illumination is both computationally expensive and time consuming.  This repository contains MATLAB software to store these flight paths in a bag file.  These bag files may be used in simulation studies (e.g., AirSim, Gazebo) that investigate alternative architectures for an FLS display, lighting designs for FLSs and their rendering of different scenes, and algorithms for FLS failure handling and battery charging.

Authors:  Hamed Alimohammadzadeh (halimoha@usc.edu), Daryon Mehrabon (daryonm@gmail.com), Shahram Ghandeharizadeh (shahram@usc.edu)

This software was developed using MATLAB R2022b for academic use.

# Features

  * Store the flight paths of FLSs to illuminate a motion illumination in a bag file. 
  * Retrieve a specific point cloud of a sequence that constitutes a scene. 
  * Retrieve a specific scene.
  * Retrieve a range of point clouds in a sequence that constitutes a scene.
  * Retrieve a point cloud given its id in a sequence that constitutes a scene.

# Limitations
To generate a bag file, the flight path of FLSs must be formatted as described in Create a Bag File below.  This is the only format we are aware of given the novely of FLSs and their displays.  We will extend this repository with additional formats for FLS flight paths as they become available.  

# Getting the Source
```bash
git clone https://github.com/shahramg/FLSbagfiles
```

# Environment
Install MATLAB with support for ROS.   
Launch MATLAB from the directory that contains FLSbagfiles.
Initialize ROS by issuing the following line in the command line:
```bash
rosinit
```

Generate the fls message type by issuing the following command in the MATLAB command line:
```
rosgenmsg('./ROSpackages/")
```

Verify the FLS message is registered with ROS by issuing the following command and find 'flyinglightspeck/fls' on this list.  
```
rosmsg list
```

If 'flyinglightspeck/fls' does not exist on the list then consider re-setting the ROS message list and clearing its cache by issuing the following commands:
```
clear classes;
rehash toolboxcache;
```

# Create a Bag File
To create a bag file use the following command:
```
writeFlightPathToFile(FLSArray, Filename, Topic)
```
FLSArray is an in-memory formatting of the flight paths for each FLS.  Filename specifies the path for a bagfile.  Topic specifies the topic of the bag file which the messages will be written to.  They are used when the FLS flight paths are generated using a named communication channel, see wiki.ros.org/Topics for details.

![alt text](https://github.com/shahramg/FLSbagfile/blob/main/flsarray.png?raw=true)

![alt text](https://github.com/shahramg/FLSbagfile/blob/main/msgelt.png?raw=true)
