#!/bin/sh
OUT_DIR="ios_out"
SRC_DIR=(
"bgfx/.build/ios-arm64/bin/"
"bgfx/.build/ios-arm/bin/"
"bgfx/.build/ios-simulator/bin/"
"bgfx/.build/ios-simulator64/bin/"
)

#执行合并包命令
function mergePackage() {
    name=$1;
    param=""

    for(( i=0;i<${#SRC_DIR[@]};i++)) do
        param+=${SRC_DIR[i]}${name}
        param+=' '
    done;

    param+=-output
    param+=' '
    param+=${OUT_DIR}/${name}

    echo "\nlipo -create ${param}"
    lipo -create ${param}
    echo "check ---------------------------------"
    lipo -info ${OUT_DIR}/${name}
}

#开始执行脚本
echo $PWD

#编译各平台库
cd bgfx
echo "------------ 脚本-开始-编译 ------------------"
make ios-arm-release && make ios-arm64-release && make ios-simulator-release
echo "------------ 脚本-结束-编译 ------------------\n"

#合并各平台库
cd ..
mkdir -p ${OUT_DIR} && open ${OUT_DIR} &

mergePackage libbgfxRelease.a
mergePackage libbxRelease.a
mergePackage libbimgRelease.a
mergePackage libbimg_decodeRelease.a

#fuyuanliang用户走此分支
if [[ $PWD =~ "fuyuanliang" ]];then
    COPY_DIR="/Users/fuyuanliang/workspace/brushcore-develop/brush-v2/core/cpp/thirdpart/bgfx/prebuild/ios/"
    mkdir -p ${COPY_DIR}
    
    cp -rf ${OUT_DIR}/libbgfxRelease.a ${COPY_DIR}/libbgfxRelease.a
    cp -rf ${OUT_DIR}/libbxRelease.a ${COPY_DIR}/libbxRelease.a
    cp -rf ${OUT_DIR}/libbimgRelease.a ${COPY_DIR}/libbimgRelease.a
    cp -rf ${OUT_DIR}/libbimg_decodeRelease.a ${COPY_DIR}/libbimg_decodeRelease.a
    
    open ${COPY_DIR} &
fi




