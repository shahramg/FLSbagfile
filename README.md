# FLSbagfile
The software of this repository creates bag files that describe the flight path of FLSs to render illuminations.  A Flying Light Speck, FLS, is a miniature sized drone configured with light sources.  Swarms of FLSs will illuminate an object in a 3D volume, an FLS display.  Computing the flight path of FLSs to render an illumination is both computationally expensive and time consuming.  This repository contains MATLAB software to store these flight paths in a bag file.  These bag files may be used in simulation studies (e.g., AirSim, Gazebo) that investigate alternative architectures for an FLS display, lighting designs for FLSs and their rendering of different scenes, and algorithms for FLS failure handling and battery charging.

Authors:  Hamed Alimohammadzadeh (halimoha@usc.edu), Daryon Mehraban (daryonm@gmail.com), Shahram Ghandeharizadeh (shahram@usc.edu)

This software was developed using MATLAB R2022b for academic use.

# Features

  * Store the flight paths of FLSs to illuminate a motion illumination in a bag file. 
  * Retrieve a specific point cloud of a sequence that constitutes a scene. 
  * Retrieve a specific scene.
  * Retrieve a range of point clouds in a sequence that constitutes a scene.
  * Retrieve a point cloud given its id in a sequence that constitutes a scene.

# Limitations
To generate a bag file, the in-memory representation of FLS flight paths must adhere to the format described in Create a Bag File below.  This is the only format we are aware of given the novely of FLSs and their displays.  We will extend this repository with additional in-memory formats for FLS flight paths as they become available.  

# Getting the Source
```bash
git clone https://github.com/shahramg/FLSbagfiles
```

# Environment
Install MATLAB with support for ROS.   

Launch MATLAB from the directory that contains FLSbagfiles.
Initialize ROS by issuing the following command in the command line:
```bash
rosinit
```

Generate the fls message types by issuing the following command in the MATLAB command line:
```
rosgenmsg('./ROSpackages/")
```

Verify the FLS message types are registered with ROS by issuing the following command and find 'flyinglightspeck/fls' on this list.  
```
rosmsg list
```

If 'flyinglightspeck/fls' does not exist on the list then consider re-setting the ROS message list and clearing its cache by issuing the following commands:
```
clear classes;
rehash toolboxcache;
```
Repeat the rosgenmsg command to register FLS message types with ROS.

Run the following test to verify the FLS required ROS messages have been created successfully.
```
runtests("FLSbagfileTest")
```
This test checks for the existence of the following custom message types in the MATLAB environment:  flyinglightspeck/fls, flyinglightspeck/FLSLHD, flyinglightspeck/FLSDuration, flyinglightspeck/FLSRGBA.

# Create a Bag File
To create a bag file for FLS flight paths use the following command:
```
writeFlightPathToFile(FLSArray, Filename, Topic)
```
FLSArray is an in-memory formatting of the flight paths for each FLS.  Filename specifies the path for a bagfile.  Topic specifies the topic of the bag file which the messages will be written to.  They are used when the FLS flight paths are generated using a named communication channel, see wiki.ros.org/Topics for details.

If the specified Filename exists then writeFlightPathToFile asks whether the Filename should be overwritten.

FLSArray is an array of arrays, see figure below.  Each array contains msgElt instances.  FLSArray{i} is the array of msgElt instances for FLS i.  There may be one or more instances for each FLS depending on its flight path.  The number of instances for each FLS may not exceed the number of point clouds in a sequence. 
![alt text](https://github.com/shahramg/FLSbagfile/blob/main/images/flsarray.png?raw=true)

Each msgElt consists of a coordClass, colorClass, and durationClass, see figure below.
![alt text](https://github.com/shahramg/FLSbagfile/blob/main/images/msgelt.png?raw=true)
