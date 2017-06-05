# zebrafish_tracker

Authors:

    Peter Polidoro <polidorop@janelia.hhmi.org>

License:

    BSD

## Run

```shell
zebrafish_tracker
```

## Run Nodes Independently

```shell
rosrun pointgrey_camera_driver list_cameras
roslaunch pointgrey_camera_driver camera.launch
```

```shell
rosrun rqt_reconfigure rqt_reconfigure
```

```shell
rosrun image_view image_view image:=/camera/image_raw _image_transport:=theora
```

```shell
rostopic echo /camera/image_raw | grep -e height -e width
```

```shell
rostopic hz /camera/image_raw
```

## Install

```shell
mkdir ~/bin
ln -s ~/zebrafish_tracker_ws/src/zebrafish_tracker/zebrafish_tracker ~/bin/zebrafish_tracker
echo "export PATH=$HOME/bin:$PATH" >> ~/.bashrc
source ~/.bashrc
```
