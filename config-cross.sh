SYSROOT="/group/xrlabs/platforms/pynq_on_versal_vck190/vck190-sysroot"
LINKER="lld"
#HOST_BUILD="/wrk/hdstaff/stephenn/nobkup/acdc-install"

CLANG_VER=8
cmake -GNinja \
		-DLLVM_DIR=$1/../peano/lib/cmake/llvm \
		-DMLIR_DIR=$1/../peano/lib/cmake/mlir \
		-DCMAKE_C_COMPILER=clang-${CLANG_VER} \
		-DCMAKE_CXX_COMPILER=clang++-${CLANG_VER} \
		-DCMAKE_ASM_COMPILER=clang-${CLANG_VER} \
		-DCMAKE_C_LINK_FLAGS="-static-libgcc -static-libstdc++ -static -fuse-ld=${LINKER} -L${SYSROOT}/usr/lib/gcc/aarch64-linux-gnu/7" \
		-DCMAKE_CXX_LINK_FLAGS="-static-libgcc -static-libstdc++ -static -fuse-ld=${LINKER} -L${SYSROOT}/usr/lib/gcc/aarch64-linux-gnu/7" \
        -DCMAKE_C_IMPLICIT_LINK_LIBRARIES="gcc" \
        -DCMAKE_CXX_IMPLICIT_LINK_LIBRARIES="gcc" \
		-DCMAKE_BUILD_TYPE=MinSizeRel \
-DCMAKE_CROSSCOMPILING=ON \
-DCMAKE_C_FLAGS="--sysroot=${SYSROOT} --target=aarch64-linux-gnu -static -fuse-ld=${LINKER} -Wno-unused-command-line-argument" \
-DCMAKE_CXX_FLAGS="--sysroot=${SYSROOT} --target=aarch64-linux-gnu -static -fuse-ld=${LINKER} -Wno-unused-command-line-argument" \
        -DCMAKE_INSTALL_PREFIX=$3 \
		-B$1 -H$2

		# -DCMAKE_C_COMPILER=/wrk/hdstaff/stephenn/llvm-project/build_X86/bin/clang \
		# -DCMAKE_CXX_COMPILER=/wrk/hdstaff/stephenn/llvm-project/build_X86/bin/clang++ \
		# -DLLVM_USE_LINKER=lld \


#cmake -GNinja -DBUILD_SHARED_LIBS=ON -DLLVM_ENABLE_PROJECTS="clang;lld" -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD="AIE;RISCV;ARC" -DLLVM_TARGETS_TO_BUILD="" -DCMAKE_C_COMPILER=/tools/batonroot/rodin/devkits/lnx64/gcc-7.1.0/bin/gcc  -DCMAKE_CXX_COMPILER=/tools/batonroot/rodin/devkits/lnx64/gcc-7.1.0/bin/g++ -DLLVM_TOOL_MLIR_BUILD=OFF ../llvm

