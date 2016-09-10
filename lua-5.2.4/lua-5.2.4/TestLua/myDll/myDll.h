/*
lib也有静态lib和动态lib，dll是动态链接库
静态lib：将导出声明和实现都放在lib中，编译后所有代码都嵌入到宿主程序中去

动态lib：相当于一个.h文件，对实现部分dll的导出部分的声明。编译后只是将导出声明部分编译到宿主程序中，
运行时需要相应的dll文件的支持。当生成一个新的dll时，也会配套的lib产生(一起分发),此lib为动态lib

extern "C" 是当提醒编译器以c的风格编译函数,C++为了重载函数，在编译的时候把函数名和参数类型名做了连接,
如以下，编译后的是add_int_int,为了兼容C，在函数声明的时候加extern "C"

使用dll可有两种方法，看解决方案其他部分


*/
#pragma once
extern "C" _declspec(dllexport) int addx(int a, int b);