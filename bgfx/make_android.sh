#!/bin/bash

#export ANDROID_NDK_ROOT="/Users/liy/Library/Android/sdk/ndk-bundle"
export ANDROID_NDK_ROOT="/Users/liy/android/android-ndk-r16b"
export ANDROID_NDK_ARM="${ANDROID_NDK_ROOT}/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64"
export ANDROID_NDK_ARM64="${ANDROID_NDK_ROOT}/toolchains/aarch64-linux-android-4.9/prebuilt/darwin-x86_64"
export ANDROID_NDK_X86="${ANDROID_NDK_ROOT}/toolchains/x86-4.9/prebuilt/darwin-x86_64"
export ANDROID_NDK_CLANG="${ANDROID_NDK_ROOT}/toolchains/llvm/prebuilt/darwin-x86_64"
../bx/tools/bin/darwin/genie --with-android=19 --gcc=android-arm gmake
../bx/tools/bin/darwin/genie --with-android=22 --gcc=android-arm64 gmake
../bx/tools/bin/darwin/genie --with-android=19 --gcc=android-x86 gmake
(cd .build/projects/gmake-android-arm && make config=debug)
(cd .build/projects/gmake-android-arm && make config=release)
(cd .build/projects/gmake-android-arm64 && make config=debug)
(cd .build/projects/gmake-android-arm64 && make config=release)
(cd .build/projects/gmake-android-x86 && make config=debug)
(cd .build/projects/gmake-android-x86 && make config=release)
cp .build/android-x86/bin/* /Users/liy/work/gerrit/brushcore/thirdpart/bgfx/prebuilt/android/x86/
cp .build/android-arm/bin/* /Users/liy/work/gerrit/brushcore/thirdpart/bgfx/prebuilt/android/armeabi-v7a/
cp .build/android-arm64/bin/* /Users/liy/work/gerrit/brushcore/thirdpart/bgfx/prebuilt/android/arm64-v8a/
