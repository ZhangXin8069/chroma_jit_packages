file_path=$(cd . && pwd)
# install_path=$(cd ${file_path}/../external-libraries && pwd) #absolute path
install_path=${HOME}/external-libraries #absolute path
mkdir ${install_path} -p

# conda init && source ~/.bashrc
# conda install git g++ gcc gfortran libopenblas-dev liblapack-dev libboost-dev \
#     libboost-filesystem-dev libboost-program-options-dev libboost-regex-dev \
#     libboost-serialization-dev libboost-system-dev libboost-thread-dev \
#     libxml2-dev libxslt1-dev zlib1g-dev libbz2-dev libffi-dev \
#     libssl-dev libncurses5-dev libhdf5-dev cmake

module purge
module load autoconf/2.69-intel-2022.0.2
module load automake/1.16.5-intel-2022.0.2
module load cmake/3.22.2-gcc-10.3.0
module load cuda/11.4.4-gcc-10.3.0
module load git/2.40.0-gcc-10.3.0
module load hdf5/1.14.0-gcc-10.3.0
module load miniconda3/22.11.1-gcc-10.3.0
module load openmpi/4.1.2-gcc-10.3.0

# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/public/home/zhangxin/tmp_lib/
# export LIBRARY_PATH=$LIBRARY_PATH:/public/home/zhangxin/tmp_lib/
CUDA_INSTALL_PATH=/public/soft/linux-centos7-x86_64/gcc-10.3.0/cuda-11.4.4-uizl3zvwy66u3bqllanvuxwxxwfyytwo/
MPI_HOME=/public/soft/linux-centos7-x86_64/gcc-10.3.0/openmpi-4.1.5-5jp5lnxsmoilvbssatnylov53a7lcp2p/
GCC_HOME=/public/soft/linux-centos7-x86_64/gcc-4.8.5/gcc-10.3.0-uoicdrf766usj4ma5wxqq4zaqgatfyy3/
OMP="yes"
SM=sm_86 # Kepler
MAKE="make -j 48" #rely on:lscpu,more is better
