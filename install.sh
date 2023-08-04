file_path=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
# install_path=$(cd ${file_path}/../external-libraries && pwd) #absolute path
install_path=${HOME}/external-libraries #absolute path
mkdir ${install_path} -p

pushd ${install_path}
tar xzf ${file_path}/chroma_jit_packages.tar.gz && pushd ./chroma_jit_packages/install
cp ${file_path}/env.sh .
bash ./build_qmp.sh
bash ./build_libxml2.sh
bash ./build_llvm.sh
bash ./build_qdpjit-double.sh
bash ./build_quda_qdpxx_double-cmake.sh
bash ./build_chroma-double_quda.sh
popd
