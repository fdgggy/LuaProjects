/*
需要.h头文件，需要动态lib，记录了导出函数，还需要动态库
*/
#include <iostream>
#include "myDll.h"

#pragma comment(lib, "./Debug/myDll.lib")	  //将myDll.lib库文件连接到目标文件中
extern "C" _declspec(dllimport) int addx(int a, int b);

int main()
{
	int a = addx(1, 2);
	std::cout << "a = " << a << std::endl;
	while (1);
	return 0;
}