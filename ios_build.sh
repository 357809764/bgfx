#!/bin/sh

ARM64_DIR="bgfx/.build/ios-arm64/bin/"
ARM_DIR="bgfx/.build/ios-arm/bin/"
SIM_DIR="bgfx/.build/ios-simulator/bin/"

OUT_DIR="ios_out"

cd bgfx
make ios-arm && make ios-arm64 && make ios-simulator

cd ..
mkdir -p ${OUT_DIR}

lipo -create ${ARM64_DIR}libbgfxRelease.a ${ARM_DIR}libbgfxRelease.a ${SIM_DIR}libbgfxRelease.a -output ${OUT_DIR}/libbgfxRelease.a
lipo -create ${ARM64_DIR}libbxRelease.a ${ARM_DIR}libbxRelease.a ${SIM_DIR}libbxRelease.a -output ${OUT_DIR}/libbxRelease.a
lipo -create ${ARM64_DIR}libbimgRelease.a ${ARM_DIR}libbimgRelease.a ${SIM_DIR}libbimgRelease.a -output ${OUT_DIR}/libbimgRelease.a
lipo -create ${ARM64_DIR}libbimg_decodeRelease.a ${ARM_DIR}libbimg_decodeRelease.a ${SIM_DIR}libbimg_decodeRelease.a -output ${OUT_DIR}/libbimg_decodeRelease.a

lipo -create ${ARM64_DIR}libbgfxDebug.a ${ARM_DIR}libbgfxDebug.a ${SIM_DIR}libbgfxDebug.a -output ${OUT_DIR}/libbgfxDebug.a
lipo -create ${ARM64_DIR}libbxDebug.a ${ARM_DIR}libbxDebug.a ${SIM_DIR}libbxDebug.a -output ${OUT_DIR}/libbxDebug.a
lipo -create ${ARM64_DIR}libbimgDebug.a ${ARM_DIR}libbimgDebug.a ${SIM_DIR}libbimgDebug.a -output ${OUT_DIR}/libbimgDebug.a
lipo -create ${ARM64_DIR}libbimg_decodeDebug.a ${ARM_DIR}libbimg_decodeDebug.a ${SIM_DIR}libbimg_decodeDebug.a -output ${OUT_DIR}/libbimg_decodeDebug.a

#open ${OUT_DIR} &

basedir=`pwd`
echo $basedir

#fuyuanliang用户走此分支
COPY_DIR="/Users/liy/work/gerrit/brushcore/brush-v2/core/cpp/thirdpart/bgfx/prebuild/ios/"
if [[ ${basedir} =~ "liy" ]];then
cp -rf ${OUT_DIR}/libbgfxRelease.a ${COPY_DIR}/libbgfxRelease.a
cp -rf ${OUT_DIR}/libbxRelease.a ${COPY_DIR}/libbxRelease.a
cp -rf ${OUT_DIR}/libbimgRelease.a ${COPY_DIR}/libbimgRelease.a
cp -rf ${OUT_DIR}/libbimg_decodeRelease.a ${COPY_DIR}/libbimg_decodeRelease.a
cp -rf ${OUT_DIR}/libbgfxDebug.a ${COPY_DIR}/libbgfxDebug.a
cp -rf ${OUT_DIR}/libbxDebug.a ${COPY_DIR}/libbxDebug.a
cp -rf ${OUT_DIR}/libbimgDebug.a ${COPY_DIR}/libbimgDebug.a
cp -rf ${OUT_DIR}/libbimg_decodeDebug.a ${COPY_DIR}/libbimg_decodeDebug.a

#open ${ARM64_DIR} &
#open ${ARM_DIR} &
#open ${SIM_DIR} &
#
#open ${COPY_DIR} &
fi




