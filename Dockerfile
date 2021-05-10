##pull###
FROM osrf/ros:kinetic-desktop-full
##ros setup##
SHELL ["/bin/bash", "-c"]
RUN apt update
RUN apt install ros-kinetic-pcl-ros ##ros-kinetic-***
WORKDIR /root
RUN mkdir -p catkin_ws/src
RUN cd catkin_ws/src && source /opt/ros/kinetic/setup.bash; catkin_init_workspace
RUN cd catkin_ws && source /opt/ros/kinetic/setup.bash; catkin_make
RUN cd /root && echo source /root/catkin_ws/devel/setup.bash >> .bashrc
ENV ROS_PACKAGE_PATH=/root/catkin_ws:$ROS_PACKAGE_PATH
ENV ROS_WORKSPACE=/root/catkin_ws
WORKDIR /root/catkin_ws
RUN cd src/ && git clone --recursive https://github.com/kiyoshiiriemon/little_slam
RUN source /opt/ros/kinetic/setup.bash && catkin_make
ENV ROS_PACKAGE_PATH=/root/catkin_ws:/opt/ros/kinetic/share:$ROS_PACKAGE_PATH

## install tmux##
WORKDIR /root
RUN apt install -y tmux
##init position##
WORKDIR /root

