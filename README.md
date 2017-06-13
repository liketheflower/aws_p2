# aws_p2

# how to get git
sudo yum install git

# How to configure GPU
http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/accelerated-computing-instances.html#optimize_gpu
https://aws.amazon.com/blogs/aws/new-p2-instance-type-for-amazon-ec2-up-to-16-gpus/
# the sudo yum install -y kernel-devel-`uname -r`

input command of "uname -r" from terminal.
sudo yum install -y kernel-devel-4.9.27-14.31.amzn1.x86_64

#copy file to the remote server
scp -i /Users/jimmy/Dropbox/aws/gpu_processing_jimmy_server.pem /Users/jimmy/Dropbox/aws/NVIDIA-Linux-x86_64-375.66.run  ec2-user@52.11.200.193:~/

# install the CUDA
It seems that the AWS is based on their own linux distribution. I cannot choose a spricfied version and the RHEL 6 is finally chosen as the info from internet saying that the original version is based on RHEL 5/6.
Download Installer for Linux RHEL 6 x86_64

scp -i /Users/jimmy/Dropbox/aws/gpu_processing_jimmy_server.pem /Users/jimmy/Downloads/cuda_8.0.61_375.26_linux.run  ec2-user@52.11.200.193:~/


chmod +x cuda_8.0.61_375.26_linux.run
sudo ./cuda_8.0.61_375.26_linux.run


#install cudnn
tar -xzvf cudnn-8.0-linux-x64-v5.0-ga.tgz
sudo cp cuda/lib64/* /usr/local/cuda-8.0/lib64/
sudo cp cuda/include/cudnn.h /usr/local/cuda-8.0/include/
 
 
#install tensorflow gpu
export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.10.0-cp27-none-linux_x86_64.whl
sudo pip install --upgrade $TF_BINARY_URL
