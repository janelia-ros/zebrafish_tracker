# JETSON_SETUP


## JetPack

Setup host PC with Xubuntu 14.04:

<http://cdimage.ubuntu.com/xubuntu/releases/14.04/release/>

On host PC, download JetPack:

<https://developer.nvidia.com/embedded/jetpack>

```shell
cd ~/Downloads
chmod +x JetPack-L4T-*.run
./Jetpack-L4T-x.x-linux-x64.run
```

Specify appropriate Jetson board.

Choose Full Install.

Accept All Terms and Conditions.

Automatically resolve dependency conflicts.

Install on host PC.

Put Jetson board in Force USB Recovery Mode to install on Jetson device.

To place system in Force USB Recovery Mode:

1. Power down the device. If connected, remove the AC adapter from the
   device. The device must be powered OFF, and not in a suspend or
   sleep state.

2. Connect the Micro-B plug on the USB cable to the Recovery (USB
   Micro-B) Port on the device and the other end to an available USB
   port on the host PC.

3. Connect the power adapter to the device.

4. With the system powered on:

5. Press and hold the RECOVERY FORCE button.

6. While depressing the RECOVERY FORCE button, press and release the
   RESET button.

7. Wait 2 seconds and release the RECOVERY FORCE button.

## Jetson

1. Connect a USB keyboard to the USB Type A connector of your device.

2. Connect an HDMI-compatible display to the HDMI connector on your
   device.

3. Connect the AC adapter supplied in your kit to the power connector
   of your device. Use the supplied AC adapter since it is
   appropriately rated for your device.

4. Plug the power adapter into an appropriately rated electrical
   outlet.

5. The system should power on. If not, press and release the power
   button on the device.

6. When prompted, enter ubuntu for both the user name and password.

### Update and Install Xubuntu

```shell
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get autoremove
sudo apt-get install xubuntu-desktop
sudo reboot
```

### Setup environment

```shell
sudo apt-get install emacs git -y
mkdir ~/git
cd ~/git
git clone https://github.com/peterpolidoro/home.git
mkdir ~/virtualenvs
cd ~/virtualenvs
sudo apt-get install virtualenv -y
virtualenv diskwalk2
source diswalk2/bin/activate
pip install diskwalk2
cd ~/git/home
symlinks.py -i -p
deactivate
cd ~/git
git clone https://github.com/janelia-idf/zebrafish_tracker
```

### Install FlyCapture2

### Install ROS

```shell
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-get update
sudo apt-get install ros-kinetic-desktop-full
```

```shell
sudo apt-get update
sudo c_rehash /etc/ssl/certs
sudo rosdep init
cd ~/git
git clone https://github.com/janelia-ros/rosdep_sources.git
sudo cp ~/git/rosdep_sources/19-janelia.list /etc/ros/rosdep/sources.list.d/19-janelia.list
rosdep update
echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
source ~/.bashrc
sudo apt-get install python-wstool
```

### Setup ROS Workspace

```shell
mkdir -p ~/zebrafish_tracker_ws/src
cd ~/zebrafish_tracker_ws/src
git clone https://github.com/janelia-ros/zebrafish_tracker.git
cd ..
wstool init src src/zebrafish_tracker/.rosinstall
rosdep install --from-paths . --reinstall
catkin_make
echo "source ~/zebrafish_tracker_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc
```
