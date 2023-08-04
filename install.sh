source ./env.sh

pushd ${install_path}
tar xzf ${file_path}/chroma_jit_packages && pushd ./chroma_jit_packages/install
bash ./build_qmp.sh
bash ./build_libxml2.sh
bash ./build_llvm.sh
bash ./build_qdpjit-double.sh
bash ./build_quda_qdpxx_double-cmake.sh
bash ./build_chroma-double_quda.sh
popd
