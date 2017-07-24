sudo apt-get update
sudo apt-get install -y git libopencv-dev build-essential checkinstall cmake pkg-config yasm libtiff4-dev libjpeg-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev python-dev python-numpy libtbb-dev libqt4-dev libgtk2.0-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils

echo "Creating directory OpenCV"
mkdir OpenCV
cd OpenCV
git clone https://github.com/Itseez/opencv.git 
git clone https://github.com/Itseez/opencv_contrib.git
cd opencv
mkdir release
cd release
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON \ -D BUILD_NEW_PYTHON_SUPPORT=ON \ -D WITH_V4L=ON \ -D INSTALL_C_EXAMPLES=ON \ -D INSTALL_PYTHON_EXAMPLES=ON \ -D BUILD_EXAMPLES=ON \ -D WITH_QT=ON \ -D WITH_OPENGL=ON \ -D WITH_CUDA=ON \ -D ENABLE_FAST_MATH=1 \ -D CUDA_FAST_MATH=1 \ -D WITH_CUBLAS=1 \ -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules ..
make -j8
sudo make install
sudo ldconfig
sudo ln /dev/null /dev/raw1394
echo "PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig">>~/.bashrc
echo "export PKG_CONFIG_PATH">>~/.bashrc
