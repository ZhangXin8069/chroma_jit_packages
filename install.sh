# conda init && source ~/.bashrc
# conda install git g++ gcc gfortran libopenblas-dev liblapack-dev libboost-dev \
#                         libboost-filesystem-dev libboost-program-options-dev libboost-regex-dev \
#                         libboost-serialization-dev libboost-system-dev libboost-thread-dev \
#                         libxml2-dev libxslt1-dev zlib1g-dev libbz2-dev libffi-dev \
#                         libssl-dev libncurses5-dev libhdf5-dev cmake

# >>> zhangxin initialize >>>
module purge
module load autoconf/2.69-intel-2022.0.2 
module load automake/1.16.5-intel-2022.0.2 
module load cmake/3.22.2-gcc-10.3.0
# module load cuda/10.1.243-gcc-10.3.0 
module load cuda/11.4.4-gcc-10.3.0
# module load cuda/11.6.1-gcc-10.3.0 
# module load gcc/10.3.0-gcc-4.8.5
module load git/2.40.0-gcc-10.3.0
module load hdf5/1.14.0-gcc-10.3.0 
module load miniconda3/22.11.1-gcc-10.3.0
module load openmpi/4.1.2-gcc-10.3.0
module load xz/5.2.5-intel-2022.0.2
module load zlib/1.2.11-intel-2022.0.2
# <<< zhangxin initialize <<<
source ./env.sh
pushd ./chroma_jit_pkgs/install
bash ./build_qmp.sh
bash ./build_libxml2.sh
bash ./build_llvm.sh
bash ./build_qdpjit-double.sh
bash ./build_quda_qdpxx_double-cmake.sh
bash ./build_chroma-double_quda.sh
popd
