# bgfx
open git bash
cd bgfx
../bx/tools/bin/windows/genie.exe --with-examples vs2013

windows平台编译
https://jingyan.baidu.com/article/e73e26c06740bf24adb6a7f5.html

vs2013工程配置
1、设置->属性->C/C++->预处理器->预处理器定义 去掉_HAS_ITERATOR_DEBUGGING=0，_ITERATOR_DEBUG_LEVEL=0



# iOS 平台编译
1、cd bgfx
2、make ios-arm  && make ios-arm64 && make ios-simulator
3、合并静态库
eg : lipo -create src1.a src2.a src3.a -output out.a
4、查看静态库支持的架构
eg : lipo -info libbgfxRelease.a
       Architectures in the fat file: libbgfxRelease.a are: armv7 i386 arm64
5、生成工程
../bx/tools/bin/darwin/genie --with-examples --xcode=ios xcode8

附：
iOS平台编译执行ios_build.sh文件
