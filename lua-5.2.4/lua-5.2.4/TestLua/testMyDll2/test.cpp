/*
��Ҫ.hͷ�ļ�����Ҫ��̬lib����¼�˵�������������Ҫ��̬��
*/
#include <iostream>
#include "myDll.h"

#pragma comment(lib, "./Debug/myDll.lib")	  //��myDll.lib���ļ����ӵ�Ŀ���ļ���
extern "C" _declspec(dllimport) int addx(int a, int b);

int main()
{
	int a = addx(1, 2);
	std::cout << "a = " << a << std::endl;
	while (1);
	return 0;
}