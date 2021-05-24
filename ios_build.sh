#!/bin/sh

SRC_DIR=(
"bgfx/.build/ios-arm64/bin/"
"bgfx/.build/ios-arm/bin/"
"bgfx/.build/ios-simulator/bin/"
"bgfx/.build/ios-simulator64/bin/"
)

LIB_NAME1=(
"libbgfxRelease.a"
"libbxRelease.a"
"libbimgRelease.a"
"libbimg_decodeRelease.a"
)

LIB_NAME2=(
"libbgfxDebug.a"
"libbxDebug.a"
"libbimgDebug.a"
"libbimg_decodeDebug.a"
)

OUT_DIR="ios_out"

cd bgfx
make ios-arm && make ios-arm64 && make ios-simulator && make ios-simulator64

cd ..
mkdir -p ${OUT_DIR}

echo "-----------------   lipo -create start -------------------"
for(( i=0;i<4;i++)) do
    lipo -create ${SRC_DIR[0]}${LIB_NAME1[i]} ${SRC_DIR[1]}${LIB_NAME1[i]} ${SRC_DIR[2]}${LIB_NAME1[i]} ${SRC_DIR[3]}${LIB_NAME1[i]} -output ${OUT_DIR}/${LIB_NAME1[i]}
    lipo -info ${OUT_DIR}/${LIB_NAME1[i]}
    
    lipo -create ${SRC_DIR[0]}${LIB_NAME2[i]} ${SRC_DIR[1]}${LIB_NAME2[i]} ${SRC_DIR[2]}${LIB_NAME2[i]} ${SRC_DIR[3]}${LIB_NAME2[i]} -output ${OUT_DIR}/${LIB_NAME2[i]}
    lipo -info ${OUT_DIR}/${LIB_NAME2[i]}
done;
#lipo -create ${ARM64_DIR}libbgfxRelease.a ${ARM_DIR}libbgfxRelease.a ${SIM_DIR}libbgfxRelease.a ${SIM64_DIR}libbgfxRelease.a -output ${OUT_DIR}/libbgfxRelease.a
echo "-----------------   lipo -create end   -------------------"

#open ${OUT_DIR} &

basedir=`pwd`
echo $basedir

#fuyuanliang用户走此分支
COPY_DIR="/Users/liy/work/gerrit/brushcore/thirdpart/bgfx/prebuilt/ios/"
if [[ ${basedir} =~ "liy" ]];then
cp -rf ${OUT_DIR}/ ${COPY_DIR}/

#open ${ARM64_DIR} &
#open ${ARM_DIR} &
#open ${SIM_DIR} &
#
#open ${COPY_DIR} &
fi




