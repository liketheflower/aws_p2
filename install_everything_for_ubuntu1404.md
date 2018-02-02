# update the GPU driver?
NOT needed

if the new ubuntu machine has a lower level GPU driver, we do not need to update the GPU driver and we can do it by installing the CUDA directly as the GPU driver will be updated during the installation.


# Install CUDA for Ubuntu

There is an Linux installation guide. 
  http://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#axzz4jHO99tiV

Download NVIDIA CUDA Toolkit: "runfile (local)". That is 1.1 GB.
  https://developer.nvidia.com/cuda-downloads

1) download the cuda 8.0
```
wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run
```
2) change the file name:
```
mv cuda_8.0.61_375.26_linux-run cuda_8.0.61_375.26_linux.run
```
3) Check the md5 sum. Only continue if it is correct.
```
md5sum cuda_8.0.61_375.26_linux.run
```

4)Remove any other installation.
  sudo apt-get purge nvidia-cuda*
if you want to install the drivers
  sudo apt-get purge nvidia-*

5)Logout from your account 
  On the login screen, go to a terminal session:
    ctrl+alt+F2
  Stop lightdm:
    sudo service lightdm stop
  Create a file at /etc/modprobe.d/blacklist-nouveau.conf with the following contents:
    blacklist nouveau 
    options nouveau modeset=0
  Then regenerate the kernel initramfs:
    sudo update-initramfs -u

Run cuda installer. Follow the command-line prompts
  sudo sh cuda_8.0.61_375.26_linux.run --override

Start lightdm again:
  sudo service lightdm start

Restart computer:
  sudo reboot

Post Installation:
  Add this path to the PATH variable:
    export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}
  Change the environment variables for 64-bit operating systems:
    export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64\
      ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
Try running nvcc, if you get this output it works:
    nvcc -V
    
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2016 NVIDIA Corporation
Built on Tue_Jan_10_13:22:03_CST_2017
Cuda compilation tools, release 8.0, V8.0.61


2nd version
export PATH=$PATH:/usr/local/cuda-8.0/bin
vi ~/.profile
paste export PATH=$PATH:/usr/local/cuda-8.0/bin at end of file
source ~/.profile


# Install cudnn6 for Ubuntu

1) download cudnn from the website(account as a nvidia developer maybe needed)
https://developer.nvidia.com/rdp/cudnn-download
and you can get a file:cudnn-8.0-linux-x64-v6.0.tgz
2) unzip the file:
tar -xzvf cudnn-8.0-linux-x64-v6.0.tgz
3) run the commands below:
sudo cp cuda/lib64/* /usr/local/cuda-8.0/lib64/
sudo cp cuda/include/cudnn.h /usr/local/cuda-8.0/include/


# install GPU tensorflow by using pip based on python2.7

sudo apt-get install python-pip python-dev
sudo pip install --upgrade https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-1.4.0-cp27-none-linux_x86_64.whl




# install OPENCV
pls follow the get_opencv.sh
when it is done, add the path of the 
cv2.so to the PYTHONPATH
```
export PYTHONPATH=/home/ioannis/OpenCV/opencv/release/lib:$PYTHONPATH

```


# update the python packages
sudo apt-get install python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose


# install keras
sudo pip install keras
