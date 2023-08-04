file_path=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
# install_path=$(cd ${file_path}/../external-libraries && pwd) #absolute path
install_path=$(cd ~/external-libraries && pwd) #absolute path
mkdir ${install_path} -p

# SET UP ENVIRONMENT
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/public/home/zhangxin/tmp_lib/
# export LIBRARY_PATH=$LIBRARY_PATH:/public/home/zhangxin/tmp_lib/
CUDA_INSTALL_PATH=/public/soft/linux-centos7-x86_64/gcc-10.3.0/cuda-11.4.4-uizl3zvwy66u3bqllanvuxwxxwfyytwo
MPI_HOME=/public/soft/linux-centos7-x86_64/gcc-10.3.0/openmpi-4.1.2-b5o3ncskbkmlhmaiczcj3x3qjryjk3kr
GCC_HOME=/public/soft/linux-centos7-x86_64/gcc-10.3.0/gcc-8.4.0-ofqrn6geya53bwo2tetd4ywobj7ubokp
OMP="yes"
SM=sm_86 # Kepler
MAKE="make -j 48" #rely on:lscpu,more is better