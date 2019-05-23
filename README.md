# bgfx
open git bash
cd bgfx
../bx/tools/bin/windows/genie.exe --with-examples vs2013

windows平台编译
https://jingyan.baidu.com/article/e73e26c06740bf24adb6a7f5.html

vs2013工程配置
1、设置->属性->C/C++->预处理器->预处理器定义 去掉_HAS_ITERATOR_DEBUGGING=0，_ITERATOR_DEBUG_LEVEL=0
