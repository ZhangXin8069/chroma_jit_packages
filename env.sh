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
SM=sm_86          # Kepler
MAKE="make -j 48" #rely on:lscpu,more is better

#just change above 

# The directory containing the build scripts, this script and the src/ tree
TOPDIR=$(cd . && pwd) 
#export CUDA_INSTALL_PATH=/usr/local/cuda-10.0
export PATH=${GCC_HOME}/bin:${CUDA_INSTALL_PATH}/bin:${MPI_HOME}/bin:$PATH

# Install directory
SRCDIR=${TOPDIR}/../
BUILDDIR=${TOPDIR}/build
mkdir ${BUILDDIR}
INSTALLDIR=${TOPDIR}/bin/${SM}
if [ "x${OMP}x" == "xyesx" ]; then
    INSTALLDIR=${INSTALLDIR}_omp
fi
LLVM_INSTALL_DIR=${INSTALLDIR}/llvm-nvptx
export PATH=$PATH:${LLVM_INSTALL_DIR}/bin
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${LLVM_INSTALL_DIR}/lib
export C_INCLUDE_PATH=${C_INCLUDE_PATH}:${LLVM_INSTALL_DIR}/include
export CPLUS_INCLUDE_PATH=${CPLUS_INCLUDE_PATH}:${LLVM_INSTALL_DIR}/include

### ENV VARS for CUDA/MPI
# These are used by the configure script to make make.inc
PK_CUDA_HOME=${CUDA_INSTALL_PATH}
PK_MPI_HOME=${MPI_HOME}
PK_GPU_ARCH=${SM}

### OpenMP
# Open MP enabled
if [ "x${OMP}x" == "xyesx" ]; then
    OMPFLAGS="-fopenmp -D_REENTRANT"
    #OMPFLAGS="-fopenmp"
    OMPENABLE="--enable-openmp"
else
    OMPFLAGS=""
    OMPENABLE=""
fi
if [ ! -d ${INSTALLDIR} ]; then
    mkdir -p ${INSTALLDIR}
fi

### COMPILER FLAGS
ARCHFLAGS="-march=native"
DEBUGFLAGS="-g"
#DEBUGFLAGS=""
#PK_CXXFLAGS="${OMPFLAGS} ${ARCHFLAGS} ${DEBUGFLAGS} -O3 -std=gnu++11 -fexceptions -frtti -g"
PK_CXXFLAGS="${OMPFLAGS} ${ARCHFLAGS} ${DEBUGFLAGS} -O3 -std=c++1y -fexceptions -frtti -fPIC"
PK_CFLAGS="${OMPFLAGS} ${ARCHFLAGS} ${DEBUGFLAGS}  -O3 -std=gnu99 -fPIC"
#PK_CFLAGS="${ARCHFLAGS} -O3 -std=gnu99 -g"
# PK_LDFLAGS="-L${CUDA_INSTALL_PATH}/lib64 -L${CUDA_INSTALL_PATH}/lib64/stubs -L${CUDA_INSTALL_PATH}/nvvm/lib64"
PK_LDFLAGS="-L${CUDA_INSTALL_PATH}/lib64 -L${CUDA_INSTALL_PATH}/lib64/stubs -L${CUDA_INSTALL_PATH}/nvvm/lib64"
PK_LIBS="${PK_LDFLAGS}"

### MPI and compiler choices
PK_CC=mpicc
PK_CXX=mpicxx
PK_LLVM_CXX=g++
PK_LLVM_CC=gcc
# PK_LLVM_CFLAGS="-O3 -std=c99"
PK_LLVM_CXXFLAGS=" -O3 -std=c++11"
QDPJIT_HOST_ARCH="X86;NVPTX"
