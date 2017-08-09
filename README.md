# zebrafish_tracker

Authors:

    Peter Polidoro <polidorop@janelia.hhmi.org>

License:

    BSD

## Run

```shell
roslaunch zebrafish_tracker_launch raw_video_file.launch video_stream_provider:=/home/polidorop/zebrafish_tracker/Videos/dark3_uint8_1024x1200_2500frames.raw width:=1024 height:=1200 frame_count:=2500 fps:=50
```

```shell
roslaunch zebrafish_tracker_launch camera.launch
```

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

### Setup Jetson

[nvidia_jetson_setup](https://github.com/janelia-idf/nvidia_jetson_setup.git)

### Zebrafish Tracker Repositories

```shell
mkdir -p ~/zebrafish_tracker_ws/src
cd ~/zebrafish_tracker_ws/src
git clone https://github.com/janelia-ros/zebrafish_tracker.git
git clone https://github.com/janelia-ros/blob_tracker_ros.git
cd ..
wstool init src src/zebrafish_tracker/.rosinstall
catkin_make
echo "source ~/zebrafish_tracker_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc
```

```shell
mkdir ~/bin
ln -s ~/zebrafish_tracker_ws/src/zebrafish_tracker/zebrafish_tracker ~/bin/zebrafish_tracker
echo "export PATH=$HOME/bin:$PATH" >> ~/.bashrc
source ~/.bashrc
```
