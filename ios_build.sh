#!/bin/sh

ARM64_DIR="bgfx/.build/ios-arm64/bin/"
ARM_DIR="bgfx/.build/ios-arm/bin/"
SIM_DIR="bgfx/.build/ios-simulator/bin/"

OUT_DIR="ios_out"

cd bgfx
make ios-arm-release && make ios-arm64-release && make ios-simulator-release

cd ..
mkdir -p ${OUT_DIR}

lipo -create ${ARM64_DIR}libbgfxRelease.a ${ARM_DIR}libbgfxRelease.a ${SIM_DIR}libbgfxRelease.a -output ${OUT_DIR}/libbgfxRelease.a
lipo -create ${ARM64_DIR}libbxRelease.a ${ARM_DIR}libbxRelease.a ${SIM_DIR}libbxRelease.a -output ${OUT_DIR}/libbxRelease.a
lipo -create ${ARM64_DIR}libbimgRelease.a ${ARM_DIR}libbimgRelease.a ${SIM_DIR}libbimgRelease.a -output ${OUT_DIR}/libbimgRelease.a
lipo -create ${ARM64_DIR}libbimg_decodeRelease.a ${ARM_DIR}libbimg_decodeRelease.a ${SIM_DIR}libbimg_decodeRelease.a -output ${OUT_DIR}/libbimg_decodeRelease.a

open ${OUT_DIR} &

basedir=`pwd`
echo $basedir

#fuyuanliang用户走此分支
COPY_DIR="/Users/fuyuanliang/workspace/brushcore/brush-v2/core/cpp/thirdpart/bgfx/prebuild/ios/"
if [[ ${basedir} =~ "fuyuanliang" ]];then
cp -rf ${OUT_DIR}/libbgfxRelease.a ${COPY_DIR}/libbgfxRelease.a
cp -rf ${OUT_DIR}/libbxRelease.a ${COPY_DIR}/libbxRelease.a
cp -rf ${OUT_DIR}/libbimgRelease.a ${COPY_DIR}/libbimgRelease.a
cp -rf ${OUT_DIR}/libbimg_decodeRelease.a ${COPY_DIR}/libbimg_decodeRelease.a

open ${ARM64_DIR} &
open ${ARM_DIR} &
open ${SIM_DIR} &

open ${COPY_DIR} &
fi




